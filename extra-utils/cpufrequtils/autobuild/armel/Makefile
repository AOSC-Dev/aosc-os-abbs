# Makefile for cpufrequtils
#
# Copyright (C) 2005,2006 Dominik Brodowski <linux@dominikbrodowski.net>
#
# Based largely on the Makefile for udev by:
#
# Copyright (C) 2003,2004 Greg Kroah-Hartman <greg@kroah.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 2 of the License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
#

# --- CONFIGURATION BEGIN ---

# Set the following to `true' to make a unstripped, unoptimized
# binary. Leave this set to `false' for production use.
DEBUG ?=	false

# make the build silent. Set this to something else to make it noisy again.
V ?=		false

# Internationalization support (output in different languages).
# Requires gettext.
NLS ?=		true

# Set the following to 'true' to build/install the
# cpufreq-bench benchmarking tool
CPUFRQ_BENCH ?= false

# Use the sysfs-based interface which is included in all 2.6 kernels
# built with cpufreq support
SYSFS ?=	true

# Use the proc-based interface which is used in the 2.4 patch for cpufreq
PROC ?=		true

# Prefix to the directories we're installing to
DESTDIR ?=	

# --- CONFIGURATION END ---



# Package-related definitions. Distributions can modify the version
# and _should_ modify the PACKAGE_BUGREPORT definition

VERSION =			008
LIB_MAJ=			0.0.0
LIB_MIN=			0

PACKAGE =			cpufrequtils
PACKAGE_BUGREPORT =		cpufreq@vger.kernel.org
LANGUAGES = 			de fr it cs pt


# Directory definitions. These are default and most probably
# do not need to be changed. Please note that DESTDIR is
# added in front of any of them

bindir ?=	/usr/bin
sbindir ?=	/usr/sbin
mandir ?=	/usr/man
includedir ?=	/usr/include
libdir ?=	/usr/lib
localedir ?=	/usr/share/locale
docdir ?=       /usr/share/doc/packages/cpufrequtils
confdir ?=      /etc/

# Toolchain: what tools do we use, and what options do they need:

CP = cp -fpR
INSTALL = /usr/bin/install -c
INSTALL_PROGRAM = ${INSTALL}
INSTALL_DATA  = ${INSTALL} -m 644
INSTALL_SCRIPT = ${INSTALL_PROGRAM}

# If you are running a cross compiler, you may want to set this
# to something more interesting, like "arm-linux-".  If you want
# to compile vs uClibc, that can be done here as well.
CROSS = #/usr/i386-linux-uclibc/usr/bin/i386-uclibc-
CC = $(CROSS)gcc
LD = $(CROSS)gcc
AR = $(CROSS)ar
STRIP = $(CROSS)strip
RANLIB = $(CROSS)ranlib
HOSTCC = gcc


# Now we set up the build system
#

# set up PWD so that older versions of make will work with our build.
PWD = $(shell pwd)

export CROSS CC AR STRIP RANLIB CFLAGS LDFLAGS LIB_OBJS

# check if compiler option is supported
cc-supports = ${shell if $(CC) ${1} -S -o /dev/null -xc /dev/null > /dev/null 2>&1; then echo "$(1)"; fi;}

# use '-Os' optimization if available, else use -O2
OPTIMIZATION := $(call cc-supports,-Os,-O2)

WARNINGS := -Wall -Wchar-subscripts -Wpointer-arith -Wsign-compare
WARNINGS += $(call cc-supports,-Wno-pointer-sign)
WARNINGS += $(call cc-supports,-Wdeclaration-after-statement)
WARNINGS += -Wshadow

CPPFLAGS += -DVERSION=\"$(VERSION)\" -DPACKAGE=\"$(PACKAGE)\" \
		-DPACKAGE_BUGREPORT=\"$(PACKAGE_BUGREPORT)\" -D_GNU_SOURCE

UTIL_SRC = 	utils/info.c utils/set.c 
LIB_HEADERS = 	lib/cpufreq.h lib/interfaces.h
LIB_SRC = 	lib/cpufreq.c
LIB_OBJS = 	lib/cpufreq.o

CFLAGS +=	-pipe

ifeq ($(strip $(PROC)),true)
	LIB_OBJS += lib/proc.o
	LIB_SRC += lib/proc.c
	CPPFLAGS += -DINTERFACE_PROC
endif

ifeq ($(strip $(SYSFS)),true)
	LIB_OBJS += lib/sysfs.o
	LIB_SRC += lib/sysfs.c
	CPPFLAGS += -DINTERFACE_SYSFS
endif

ifeq ($(strip $(NLS)),true)
	INSTALL_NLS += install-gmo
	COMPILE_NLS += update-gmo
endif

ifeq ($(strip $(CPUFRQ_BENCH)),true)
	INSTALL_BENCH += install-bench
	COMPILE_BENCH += compile-bench
endif

CFLAGS += $(WARNINGS)

ifeq ($(strip $(V)),false)
	QUIET=@$(PWD)/build/ccdv
	HOST_PROGS=build/ccdv
else
	QUIET=
	HOST_PROGS=
endif

# if DEBUG is enabled, then we do not strip or optimize
ifeq ($(strip $(DEBUG)),true)
	CFLAGS += -O1 -g
	CPPFLAGS += -DDEBUG
	STRIPCMD = /bin/true -Since_we_are_debugging
else
	CFLAGS += $(OPTIMIZATION) -fomit-frame-pointer
	STRIPCMD = $(STRIP) -s --remove-section=.note --remove-section=.comment
endif




# the actual make rules

all: ccdv libcpufreq utils $(COMPILE_NLS) $(COMPILE_BENCH)

ccdv: build/ccdv
build/ccdv: build/ccdv.c
	@echo "Building ccdv"
	@$(HOSTCC) -O1 $< -o $@

lib/%.o: $(LIB_SRC) $(LIB_HEADERS) build/ccdv
	$(QUIET) $(CC) $(CPPFLAGS) $(CFLAGS) -fPIC -o $@ -c lib/$*.c

libcpufreq.so.$(LIB_MAJ): $(LIB_OBJS)
	@if [ $(strip $(SYSFS)) != true -a $(strip $(PROC)) != true ]; then \
		echo '*** At least one of /sys support or /proc support MUST be enabled ***'; \
		exit -1; \
	fi;
	$(QUIET) $(CC) -shared $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) -o $@ \
		-Wl,-soname,libcpufreq.so.$(LIB_MIN) $(LIB_OBJS)
	@ln -sf $@ libcpufreq.so
	@ln -sf $@ libcpufreq.so.$(LIB_MIN)

libcpufreq: libcpufreq.so.$(LIB_MAJ)

cpufreq-%: libcpufreq.so.$(LIB_MAJ) $(UTIL_SRC)
	$(QUIET) $(CC) $(CPPFLAGS) $(CFLAGS) -I. -I./lib/ -c -o utils/$@.o utils/$*.c
	$(QUIET) $(CC) $(CFLAGS) $(LDFLAGS) -L. -o $@ utils/$@.o -lcpufreq
	$(QUIET) $(STRIPCMD) $@

utils: cpufreq-info cpufreq-set

po/$(PACKAGE).pot: $(UTIL_SRC)
	@xgettext --default-domain=$(PACKAGE) --add-comments \
		--keyword=_ --keyword=N_ $(UTIL_SRC) && \
	test -f $(PACKAGE).po && \
	mv -f $(PACKAGE).po po/$(PACKAGE).pot

update-gmo: po/$(PACKAGE).pot
	 @for HLANG in $(LANGUAGES); do \
		echo -n "Translating $$HLANG "; \
		if msgmerge po/$$HLANG.po po/$(PACKAGE).pot -o \
		   po/$$HLANG.new.po; then \
			mv -f po/$$HLANG.new.po po/$$HLANG.po; \
		else \
			echo "msgmerge for $$HLANG failed!"; \
			rm -f po/$$HLANG.new.po; \
		fi; \
		msgfmt --statistics -o po/$$HLANG.gmo po/$$HLANG.po; \
	done;

compile-bench: libcpufreq
	@V=$(V) confdir=$(confdir) $(MAKE) -C bench

clean:
	-find . \( -not -type d \) -and \( -name '*~' -o -name '*.[oas]' \) -type f -print \
	 | xargs rm -f
	-rm -f cpufreq-info cpufreq-set
	-rm -f libcpufreq.so*
	-rm -f build/ccdv
	-rm -rf po/*.gmo po/*.pot
	$(MAKE) -C bench clean


install-lib:
	$(INSTALL) -d $(DESTDIR)${libdir}
	$(CP) libcpufreq.so* $(DESTDIR)${libdir}/
	$(INSTALL) -d $(DESTDIR)${includedir}
	$(INSTALL_DATA) lib/cpufreq.h $(DESTDIR)${includedir}/cpufreq.h

install-tools:
	$(INSTALL) -d $(DESTDIR)${bindir}
	$(INSTALL_PROGRAM) cpufreq-set $(DESTDIR)${bindir}/cpufreq-set
	$(INSTALL_PROGRAM) cpufreq-info $(DESTDIR)${bindir}/cpufreq-info

install-man:
	$(INSTALL_DATA) -D man/cpufreq-set.1 $(DESTDIR)${mandir}/man1/cpufreq-set.1
	$(INSTALL_DATA) -D man/cpufreq-info.1 $(DESTDIR)${mandir}/man1/cpufreq-info.1

install-gmo:
	$(INSTALL) -d $(DESTDIR)${localedir}
	for HLANG in $(LANGUAGES); do \
		echo '$(INSTALL_DATA) -D po/$$HLANG.gmo $(DESTDIR)${localedir}/$$HLANG/LC_MESSAGES/cpufrequtils.mo'; \
		$(INSTALL_DATA) -D po/$$HLANG.gmo $(DESTDIR)${localedir}/$$HLANG/LC_MESSAGES/cpufrequtils.mo; \
	done;

install-bench:
	@#DESTDIR must be set from outside to survive
	@sbindir=$(sbindir) bindir=$(bindir) docdir=$(docdir) confdir=$(confdir) $(MAKE) -C bench install
       
install: all install-lib install-tools install-man $(INSTALL_NLS) $(INSTALL_BENCH)

uninstall:
	- rm -f $(DESTDIR)${libdir}/libcpufreq.*
	- rm -f $(DESTDIR)${includedir}/cpufreq.h
	- rm -f $(DESTDIR)${bindir}/cpufreq-set
	- rm -f $(DESTDIR)${bindir}/cpufreq-info
	- rm -f $(DESTDIR)${mandir}/man1/cpufreq-set.1
	- rm -f $(DESTDIR)${mandir}/man1/cpufreq-info.1
	- for HLANG in $(LANGUAGES); do \
		rm -f $(DESTDIR)${localedir}/$$HLANG/LC_MESSAGES/cpufrequtils.mo; \
	  done;

.PHONY: all utils libcpufreq ccdv update-po update-gmo install-lib install-tools install-man install-gmo install uninstall \
	clean 
