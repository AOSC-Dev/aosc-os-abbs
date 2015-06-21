prefix  = /usr
bindir  = $(prefix)/bin
datadir = $(prefix)/share/azminipt
menudir = ~/.local/share/applications

####################

OPTIONS = xi2
EXFLAGS =

CXX	= g++
CXXFLAGS = -march=x86-64 -mtune=core2 -O2 -pipe -fstack-protector-strong --param=ssp-buffer-size=4 -msse -msse2 -msse3 -fPIC -fno-lto -fuse-linker-plugin -Wno-error
INCLUDE = -I./azxclass/include -I/usr/include/freetype2
LFLAGS	= -Wl,-O1,--sort-common,--as-needed,-z,relro -fPIC -fno-lto -fuse-linker-plugin
LINKS	= -lrt -lX11 -lXext -lXft -lpthread -lz -lfontconfig -lfreetype
MACRO	= -D_AZMINIPT_RESDIR="\"$(datadir)\""
RM	= rm -f

TARGET	= azminipt
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

ifneq (,$(findstring xi2,$(OPTIONS)))
    MACRO += -D_AX_OPT_XI2
    LINKS += -lXi
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
	@install -dv $(datadir)
	@install -v -m 644 files/ja_JP.axt files/colmask.png files/tb_layer.png files/tb_main.png files/tb_tool.png $(datadir)
	@install -Dv -m 644 files/azminipainter.desktop $(menudir)/azminipainter.desktop

uninstall:
	-$(RM) $(bindir)/$(TARGET)
	-$(RM) $(datadir)/ja_JP.axt $(datadir)/colmask.png $(datadir)/tb_layer.png\
		$(datadir)/tb_main.png $(datadir)/tb_tool.png $(menudir)/azminipainter.desktop
	-rmdir $(datadir)
