
# Kconfig
# instead of setting 'n', leave it blank when you disable it.
CONFIG_AUFS_BRANCH_MAX_127 = y
CONFIG_AUFS_BRANCH_MAX_511 =
CONFIG_AUFS_BRANCH_MAX_1023 =
#CONFIG_AUFS_BRANCH_MAX_32767 =
CONFIG_AUFS_SBILIST = y
CONFIG_AUFS_HNOTIFY =
CONFIG_AUFS_HFSNOTIFY =
CONFIG_AUFS_EXPORT =
CONFIG_AUFS_XATTR =
CONFIG_AUFS_FHSM =
CONFIG_AUFS_RDU =
CONFIG_AUFS_SHWH =
CONFIG_AUFS_BR_RAMFS =
CONFIG_AUFS_BR_FUSE =
CONFIG_AUFS_BR_HFSPLUS =
CONFIG_AUFS_DEBUG = y
CONFIG_AUFS_MAGIC_SYSRQ =
CONFIG_AUFS_BDEV_LOOP =
CONFIG_AUFS_INO_T_64 =
CONFIG_AUFS_POLL =

########################################

define conf
ifdef $(1)
AUFS_DEF_CONFIG += -D$(1)
export $(1)
endif
endef

$(foreach i, BRANCH_MAX_127 BRANCH_MAX_511 BRANCH_MAX_1023 \
	BRANCH_MAX_32767 \
	HNOTIFY HFSNOTIFY \
	SBILIST \
	EXPORT INO_T_64 \
	XATTR \
	FHSM \
	RDU \
	SHWH \
	BR_RAMFS \
	BR_FUSE POLL \
	BR_HFSPLUS \
	DEBUG MAGIC_SYSRQ \
	BDEV_LOOP, \
	$(eval $(call conf,CONFIG_AUFS_$(i))))

########################################

ifdef CONFIG_AUFS_SBILIST
ifndef CONFIG_AUFS_MAGIC_SYSRQ
ifndef CONFIG_PROC_FS
$(warning CONFIG_AUFS_SBILIST is enabled but CONFIG_AUFS_MAGIC_SYSRQ nor CONFIG_PROC_FS)
endif
endif
else ifdef CONFIG_AUFS_MAGIC_SYSRQ
$(error CONFIG_AUFS_SBILIST is disabled but CONFIG_AUFS_MAGIC_SYSRQ)
else ifdef CONFIG_PROC_FS
$(error CONFIG_AUFS_SBILIST is disabled but CONFIG_PROC_FS)
endif

ifdef CONFIG_AUFS_HFSNOTIFY
ifndef CONFIG_FSNOTIFY
$(error CONFIG_AUFS_HFSNOTIFY requires CONFIG_FSNOTIFY)
endif
ifndef CONFIG_AUFS_HNOTIFY
$(error CONFIG_AUFS_HFSNOTIFY requires CONFIG_AUFS_HNOTIFY)
endif
endif

ifdef CONFIG_AUFS_EXPORT
ifndef CONFIG_EXPORTFS
$(error CONFIG_AUFS_EXPORT requires CONFIG_EXPORTFS)
endif
endif

ifdef CONFIG_AUFS_BR_HFSPLUS
ifndef CONFIG_HFSPLUS_FS
$(error CONFIG_AUFS_BR_HFSPLUS requires CONFIG_HFSPLUS_FS)
endif
endif

ifdef CONFIG_AUFS_MAGIC_SYSRQ
ifndef CONFIG_AUFS_DEBUG
$(error CONFIG_AUFS_MAGIC_SYSRQ requires CONFIG_AUFS_DEBUG)
endif
ifndef CONFIG_MAGIC_SYSRQ
$(error CONFIG_AUFS_MAGIC_SYSRQ requires CONFIG_MAGIC_SYSRQ)
endif
endif

ifdef CONFIG_AUFS_BDEV_LOOP
ifndef CONFIG_BLK_DEV_LOOP
$(error CONFIG_AUFS_BDEV_LOOP requires CONFIG_BLK_DEV_LOOP)
endif
endif

ifdef CONFIG_AUFS_INO_T_64
ifndef CONFIG_AUFS_EXPORT
$(error CONFIG_AUFS_INO_T_64 requires CONFIG_AUFS_EXPORT)
endif
ifdef CONFIG_64BIT
ifdef CONFIG_ALPHA
$(error ino_t on ALPHA is not 64bit)
endif
ifdef CONFIG_S390
$(error ino_t on S390 is not 64bit)
endif
else
$(error ino_t is not 64bit)
endif
endif

ifdef CONFIG_AUFS_POLL
ifndef CONFIG_AUFS_BR_FUSE
# this is not an error
$(warning AUFS_POLL is enabled but AUFS_BR_FUSE)
endif
else ifdef CONFIG_AUFS_BR_FUSE
$(error AUFS_POLL is disabled but AUFS_BR_FUSE)
endif

ifdef CONFIG_AUFS_BR_FUSE
ifndef CONFIG_FUSE_FS
# this is not an error
$(warning AUFS_BR_FUSE is enabled but FUSE_FS)
endif
endif
