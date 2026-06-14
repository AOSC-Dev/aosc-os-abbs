INPUT_FILES=$(wildcard ../../linux-kernel-rc/autobuild/*/config*)
OUTPUT_FILES=$(patsubst ../../linux-kernel-rc/autobuild/%,%,$(INPUT_FILES))

all: $(OUTPUT_FILES)

define OUTPUT_template =
$(1): ../../linux-kernel/autobuild/$(1) sync_config.mk
	mkdir -pv $$(@D)
	sed -r '/CONFIG_LOCALVERSION=/s/-(rc|main)(-|$$))/-vanillarc\2/' $$< > $$@
	case $(1) in *ppc64el* ) echo CONFIG_MATH_EMULATION=n >> $$@; esac
endef

$(foreach out,$(OUTPUT_FILES),$(eval $(call OUTPUT_template,$(out))))
