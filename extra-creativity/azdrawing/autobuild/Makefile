###########################
# install dir
###########################

prefix := /usr
ifdef DESTDIR
	prefix=$(DESTDIR)/usr
endif

bindir  := $(prefix)/bin
datadir := $(prefix)/share/azdrawing
menudir := $(prefix)/share/applications
icondir := $(prefix)/share/icons/hicolor/48x48/apps

ifeq ($(prefix),/usr/local)
  menudir := ~/.local/share/applications
  icondir := ~/.local/share/icons/hicolor/48x48/apps
endif

###########################
# macro
###########################

vpath %.cpp src src/dat src/draw src/img src/win

OPTIONS := xi2
EXFLAGS :=

TARGET := azdrawing
OBJDIR := _obj
OBJDIR_AXLIB := $(OBJDIR)/azxc
AXLIB  := $(OBJDIR)/libazxc.a

CXX := g++
CXXFLAGS := -march=x86-64 -mtune=core2 -O2 -pipe -fstack-protector-strong --param=ssp-buffer-size=4 -msse -msse2 -msse3 -fPIC -flto -fuse-linker-plugin -Wno-error
LFLAGS := -Wl,-O1,--sort-common,--as-needed,-z,relro -fPIC -flto -fuse-linker-plugin
LINKS := -lX11 -lXext -lXft -lfontconfig -lfreetype -lz -ljpeg -lrt -lpthread
MACRO := -D_AZDRAW_RESDIR="\"$(datadir)\""
MACRO_OPT :=
INCLUDE := -I/usr/include/freetype2 -I./azxclass/include\
  -I./src -I./src/dat -I./src/draw -I./src/img -I./src/win
INCLUDE_AXLIB := -I./azxclass/include -I/usr/include/freetype2

AR := ar rv
RM := rm -f
INSTALL_DAT := install -v -m 644
INSTALL_DIR := install -dv

SRCS := $(wildcard src/*.cpp)
SRCS += $(wildcard src/dat/*.cpp)
SRCS += $(wildcard src/draw/*.cpp)
SRCS += $(wildcard src/img/*.cpp)
SRCS += $(wildcard src/win/*.cpp)

OBJS := $(notdir $(SRCS))
OBJS := $(OBJS:%.cpp=$(OBJDIR)/%.o)

OBJS_AXLIB := $(notdir $(wildcard azxclass/src/*.cpp))
OBJS_AXLIB := $(OBJS_AXLIB:%.cpp=$(OBJDIR_AXLIB)/%.o)

DATAFILES := files/image.tar files/azdrawing.png files/brush_def.dat\
  files/ja_JP.axt ./README ./NEWS files/zh_CN.axt 

###########################
# MACRO_OPT
###########################

ifneq (,$(findstring asmx86,$(OPTIONS)))
  MACRO_OPT += -D_AX_OPT_ASM_X86
endif

ifneq (,$(findstring xi2,$(OPTIONS)))
  MACRO_OPT += -D_AX_OPT_XI2
  LINKS += -lXi
endif

###########################
# rule
###########################

.PHONY: all debug clean install uninstall

all: $(TARGET)

debug: CXXFLAGS=-g -Wall
debug: LFLAGS=
debug: clean $(TARGET)

$(OBJDIR):
	mkdir $(OBJDIR)

$(OBJDIR_AXLIB): $(OBJDIR)
	mkdir $(OBJDIR_AXLIB)

$(TARGET): $(AXLIB) $(OBJDIR) $(OBJS)
	$(CXX) $(LFLAGS) -o $@ $(OBJS) $(AXLIB) $(LINKS)

$(AXLIB): $(OBJDIR_AXLIB) $(OBJS_AXLIB)
	$(AR) $@ $(OBJS_AXLIB)

$(OBJDIR_AXLIB)/%.o: azxclass/src/%.cpp
	$(CXX) $(CXXFLAGS) $(EXFLAGS) $(MACRO_OPT) $(INCLUDE_AXLIB) -c $< -o $@

$(OBJDIR)/%.o: %.cpp
	$(CXX) $(CXXFLAGS) $(EXFLAGS) $(MACRO) $(MACRO_OPT) $(INCLUDE) -c $< -o $@

clean:
	-$(RM) $(TARGET)
	-rm -fr $(OBJDIR)

install:
	@install -Dv $(TARGET) $(bindir)/$(TARGET)
	@$(INSTALL_DIR) $(datadir)
	@$(INSTALL_DAT) $(DATAFILES) $(datadir)
	cp -r ./files/brush $(datadir)
	cp -r ./files/texture $(datadir)
	cp -r ./help $(datadir)
	@install -Dv -m 644 ./files/azdrawing.desktop $(menudir)/azdrawing.desktop
	@install -Dv -m 644 ./files/azdrawing.png $(icondir)/azdrawing.png

uninstall:
	-$(RM) $(bindir)/$(TARGET)
	-rm -fr $(datadir)
	-$(RM) $(menudir)/azdrawing.desktop
	-$(RM) $(icondir)/azdrawing.png
