# Append deepin/openKylin/UOS-compatible desktop XDG data directories
#
# Per an unspoken rule, these distributions agreed on a pattern for XDG data
# directories: /opt/apps/*/entries.
#
# Append them so that XDG-compliant AOSC OS desktop environments may discover
# the application entries.

# Do not allow non-matching globs to be appended to $XDG_DATA_DIRS.
shopt -s nullglob

# Fallback to /usr/local/share:/usr/share if $XDG_DATA_DIRS is empty.
if [ -z "$XDG_DATA_DIRS" ]; then
	export XDG_DATA_DIRS="/usr/local/share:/usr/share"
fi

# Append the aforementioned paths.
for opt_apps_path in /opt/apps/*/entries; do
	# Exclude paths already in $XDG_DATA_DIRS to avoid duplicates.
	if [ -n "${XDG_DATA_DIRS##*${opt_apps_path}}" ] && \
	   [ -n "${XDG_DATA_DIRS##*${opt_apps_path}:*}" ]; then
		export XDG_DATA_DIRS="${XDG_DATA_DIRS}:${opt_apps_path}"
	fi
done

# Reset to default (off).
shopt -u nullglob
