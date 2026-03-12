#!/bin/bash

# Helper functions for handling various qurik for GRUB.
# Warning: contains extreme bashism.

export ARCH="$(dpkg --print-architecture)"

# DMI strings that should be considered as generic ones, and should be
# ignored when matching. Must be in all lowercase. Keywords recommended,
# full strings are allowed.
GENERIC_STRINGS=(
	"to be filled by"	# To be filled by O. E. M.
	"product name"		# System Product Name/Baseboard Product Name
	"default "		# Default String/Model
	"generic"		# Generic Board
	"t.b.d."
	"t. b. d."
)

if [ "$QUIRKS_NDEBUG" = "1" ] ; then
	quirk_debug() {
		:
	}
else
	quirk_debug() {
		if [ -z "$QURIK_DEBUG_OUTPUT" ] ; then
			export QUIRK_DEBUG_OUTPUT="/tmp/grub-quirks.log"
		fi
		echo "$@" >> "$QUIRK_DEBUG_OUTPUT"
	}
fi

# Force the match result to be true.
matched() {
	QUIRK_MATCH="1"
}

# Check if a string matches one of the generic strings above.
is_generic() {
	local in="$1" str
	in="${in,,}"
	# Also check empty strings.
	if [ -z "$in" ] ; then
		return 0
	fi
	for str in "${GENERIC_STRINGS[@]}" ; do
		if [ "${in/$str/}" != "$in" ] ; then
		quirk_debug "String ‘$1’ is a generic string."
			return 0
		fi
	done
	quirk_debug "String ‘$1’ is not a generic string."
	return 1
}

regex_match() {
	set -o pipefail
	local in="$1" pattern="$2"
	if echo "$in" | grep -qP "$pattern" ; then
		quirk_debug "Pattern ‘$2’ matches the input ‘$1’."
		set +o pipefail
		return 0
	fi
	quirk_debug "Pattern ‘$2’ does not match the input ‘$1’."
	set +o pipefail
	return 1
}

# read_* function reads the string from the component from its name,
# exports the result.
read_lefi() {
	local out
	if [ "$ARCH" != "loongson3" ] ; then
		return
	fi
	if [ ! -e "/sys/firmware/lefi/boardinfo" ] ; then
		return
	fi
	out="$(cat /sys/firmware/lefi/boardinfo | grep 'Board Name' | cut -d: -f2)"
	out="${out##[ 	]}"
	out="${out%%[ 	]}"
	quirk_debug "Board name from LEFI: $LEFI_BOARD_NAME"
	export LEFI_BOARD_NAME="$out"
}

read_dmi() {
	if [ ! -e "/sys/firmware/dmi/tables/smbios_entry_point" ] ; then
		return
	fi
	local system_product_name="$(dmidecode --string system-product-name)"
	local baseboard_product_name="$(dmidecode --string baseboard-product-name)"
	if ! is_generic "$system_product_name" ; then
		quirk_debug "System Product Name: $system_product_name"
		export DMI_SYSTEM_NAME="$system_product_name"
	fi
	if ! is_generic "$baseboard_product_name" ; then
		quirk_debug "Baseboard Product Name: $baseboard_product_name"
		export DMI_BOARD_NAME="$baseboard_product_name"
	fi
	return
}

read_modalias() {
	if [ ! -e "/sys/devices/virtual/dmi/id/modalias" ] ; then
		return
	fi
	export DMI_MODALIAS="$(cat "/sys/devices/virtual/dmi/id/modalias")"
	quirk_debug "modalias String: $DMI_MODALIAS"
	return
}

read_dt() {
	if [ -e "/sys/firmware/devicetree/base/model" ] ; then
		DT_MODEL="$(cat /sys/firmware/devicetree/base/model | tr -d '\0')"
		quirk_debug "Model string from DT: $DT_MODEL"
		export DT_MODEL
	fi
	IFS=$'\n'
	if [ -e "/sys/firmware/devicetree/base/compatible" ] ; then
		DT_COMPATIBLE=($(cat /sys/firmware/devicetree/base/compatible | tr '\0' '\n'))
		quirk_debug "Compatible string from DT: $DT_COMPATIBLE"
		export DT_COMPATIBLE
	fi
	unset IFS
	return
}

match_efi() {
	QUIRK_MATCH=0
	if [ -d /sys/firmware/efi ] ; then
		quirk_debug "System has EFI"
		QUIRK_MATCH=1
		return 0
	fi
	quirk_debug "No EFI present"
	return 1
}

match_efi_bits() {
	local width
	QUIRK_MATCH=0
	if [ -z "$1" ] ; then
		return 1
	fi
	if ! [ -e "/sys/firmware/efi/fw_platform_size" ] ; then
		return 1
	fi
	width="$(cat /sys/firmware/efi/fw_platform_size)"
	if [ "$width" = "$1" ] ; then
		QUIRK_MATCH=1
		return 0
	fi
	return 1
}

match_efi_32() {
	match_efi_bits 32
}

match_efi_64() {
	match_efi_bits 64
}

match_writable_efivars() {
	local output=""
	QUIRK_MATCH=0
	if [ ! -d "/sys/firmware/efi/efivars" ] ; then
		return 1
	fi
	if [ -w /sys/firmware/efi/efivars ] ; then
		QUIRK_MATCH=1
		return 0
	fi
	return 1
}

match_uboot() {
	QUIRK_MATCH=0
	if [ -e "/sys/firmware/devicetree/base/chosen/u-boot,version" ] ; then
		if [ -n "$(cat /sys/firmware/devicetree/base/chosen/u-boot,version | tr -d '\0')" ] ; then
			QUIRK_MATCH=1
			return 0
		fi
	fi
	return 1
}

match_arch() {
	[ "$QUIRK_MATCH" = "1" ] && return 1
	QUIRK_MATCH=0
	if [ -z "$ARCH" ] ; then
		export ARCH="$(dpkg --print-architecture)"
	fi
	for arch in "$@" ; do
		if [ -z "$arch" ] ; then
			break
		fi
		if [ "$ARCH" = "$arch" ] ; then
			QUIRK_MATCH=1
			return 0
		fi
	done
	return 1
}

regex_match_modalias() {
	QUIRK_MATCH=0
	if [ -z "$DMI_MODALIAS" ] ; then
		return 1
	fi
	if regex_match "$DMI_MODALIAS" "$1" ; then
		QUIRK_MATCH=1
		return 0
	fi
	return 1
}

exact_match_model() {
	QUIRK_MATCH=0
	if [ -z "$1" ] ; then
		return 1
	fi
	for i in "$DMI_SYSTEM_NAME" \
		"$DMI_BOARD_NAME" \
		"$DT_MODEL" ; do
		if [ -n "$i" ] && [ "$i" =  "$1" ] ; then
			QUIRK_MATCH=1
			return 0
		fi
	done
	return 1
}

regex_match_model() {
	QUIRK_MATCH=0
	if [ -z "$1" ] ; then
		return 1
	fi
	for i in "$DMI_SYSTEM_NAME" \
		"$DMI_BOARD_NAME" \
		"$DT_MODEL" ; do
		if [ -n "$i" ] && regex_match "$i" "$1" ; then
			QUIRK_MATCH=1
			return 0
		fi
	done
	return 1
}

exact_match_dt_compatible() {
	QUIRK_MATCH=0
	for str in "${DT_COMPATIBLE[@]}" ; do
		if [ -z "$str" ] ; then
			break
		fi
		if [ "$str" = "$1" ] ; then
			QUIRK_MATCH=1
			return 0
		fi
	done
	return 1
}

regex_match_dt_compatible() {
	QUIRK_MATCH=0
	if [ -z "$1" ] ; then
		return 1
	fi
	for str in "${DT_COMPATIBLE[@]}" ; do
		if [ -z "$str" ] ; then
			break
		fi
		if regex_match "$str" "$1" ; then
			QUIRK_MATCH=1
			return 0
		fi
	done
	return 1
}

fall_through() {
	if [ "$QUIRK_MATCH" = 1 ] ; then
		SUCCEEDED=1
	fi
	QUIRK_MATCH="0"
}

prepare_quirks() {
	if [ -n "$QURIK_DEBUG_OUTPUT" ] ; then
		truncate -s 0 "$QUIRK_DEBUG_OUTPUT"
	fi
	if match_arch amd64 arm64 loongarch64 riscv64 ; then
		read_dmi
		read_modalias
	fi
	fall_through
	if match_arch amd64 arm64 riscv64 ppc64el ; then
		read_dt
	fi
	fall_through
	if match_arch loongarch64 loongson3 ; then
		read_lefi
	fi
}

do_quirks() {
	if [ -z "$1" ] ; then
		return 1
	fi
	if [ ! -d "/etc/grub.d/quirks-$1" ] ; then
		return 0
	fi
	QUIRK_MATCH=0
	SUCCEEDED=0
	for file in $(find /etc/grub.d/quirks-$1 -type f -name '*.bash' | sort) ; do
		# Don't fail if quirks in this script failed to match.
		source "$file" || true
		if [ "$QUIRK_MATCH" = "1" ] ; then
			return 0
		fi
	done
	if [ "$SUCCEEDED" = 1 ] ; then
		return 0
	fi
	return 1
}
