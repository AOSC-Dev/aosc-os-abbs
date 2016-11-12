override CXXFLAGS += -std=c++11 -DGUID_LIBUUID -fPIC
override LDFLAGS += -luuid
MAJOR := 0
MINOR := 0
VERSION := $(MAJOR).$(MINOR)
NAME = crossguid

INCLUDEDIR = /usr/include
LIBDIR = /usr/lib

LINK.o = $(LINK.cc)

SRC = $(wildcard *.cpp)
OBJ = $(SRC:.cpp=.o)
LIB = lib$(NAME).so.$(VERSION)

$(LIB): guid.o
	$(CXX) $(LDFLAGS) -shared -Wl,-soname,lib$(NAME).so.$(MAJOR) $^ -o $@

test: $(OBJ)

install: guid.h $(LIB)
	install -dm 0755 $(DESTDIR)$(INCLUDEDIR)
	install -pm 0644 guid.h $(DESTDIR)$(INCLUDEDIR)
	install -dm 0755 $(DESTDIR)$(LIBDIR)
	install -pm 0755 $(LIB) $(DESTDIR)$(LIBDIR)
	ln -sf $(LIB) $(DESTDIR)$(LIBDIR)/lib$(NAME).so
	ln -sf $(LIB) $(DESTDIR)$(LIBDIR)/lib$(NAME).so.$(MAJOR)

clean:
	$(RM) $(OBJ) $(LIB) test

.PHONY: run-test install clean 

