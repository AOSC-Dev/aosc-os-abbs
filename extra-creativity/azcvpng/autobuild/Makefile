prefix  = /usr
bindir  = $(prefix)/bin
datadir = $(prefix)/share/azcvpng
menudir = ~/.local/share/applications

####################

OPTIONS =
EXFLAGS =

CXX	= g++
CXXFLAGS = -march=x86-64 -mtune=core2 -O2 -pipe -fstack-protector-strong --param=ssp-buffer-size=4 -msse -msse2 -msse3 -fPIC -fno-lto -fuse-linker-plugin -Wno-error
INCLUDE = -I./azxclass/include -I/usr/include/freetype2
LFLAGS	= -Wl,-O1,--sort-common,--as-needed,-z,relro -fPIC -fno-lto -fuse-linker-plugin
LINKS	= -lrt -lX11 -lXext -lXft -lpthread -lz -lfontconfig -lfreetype
MACRO	= -D_AZCVPNG_RESDIR="\"$(datadir)\""
RM	= rm -f

TARGET	= azcvpng
AXLIB	= ./azxclass/libazxc.a
SRCDIR	= ./src/
OBJDIR	= ./_obj/

SRCS = $(notdir $(wildcard $(SRCDIR)*.cpp))
OBJS = $(addprefix $(OBJDIR),$(SRCS:%.cpp=%.o))

EXARGS = OPTIONS="$(OPTIONS)" EXFLAGS="$(EXFLAGS)"

#######################

ifdef DEBUGMODE
    CXXFLAGS = -g -Wall
    LFLAGS =
endif

ifneq (,$(findstring asmx86,$(OPTIONS)))
    MACRO += -D_AX_OPT_ASM_X86
endif

CXXFLAGS += $(EXFLAGS)

#######################

.PHONY: all debug clean install uninstall

all: $(AXLIB) $(TARGET)

$(AXLIB):
	$(MAKE) -C ./azxclass $(EXARGS)

$(TARGET): $(OBJS)
	$(CXX) $(LFLAGS) -o $@ $^ $(AXLIB) $(LINKS)

$(OBJDIR)%.o: $(SRCDIR)%.cpp
	$(CXX) $(CXXFLAGS) $(MACRO) $(INCLUDE) -c $< -o $@

debug:
	-$(RM) $(TARGET) $(OBJS)
	$(MAKE) debug -C ./azxclass $(EXARGS)
	$(MAKE) all DEBUGMODE=on $(EXARGS)

clean:
	$(MAKE) clean -C ./azxclass
	-$(RM) $(TARGET) $(OBJS)
	-rmdir $(OBJDIR)

install:
	@install -Dv $(TARGET) $(bindir)/$(TARGET)
	@install -Dv -m 644 files/ja_JP.axt $(datadir)/ja_JP.axt
	@install -Dv -m 644 files/azconvpng.desktop $(menudir)/azconvpng.desktop

uninstall:
	-$(RM) $(bindir)/$(TARGET)
	-$(RM) $(datadir)/ja_JP.axt
	-$(RM) $(menudir)/azconvpng.desktop
	-rmdir $(datadir)
