AC_PREREQ([2.69])
AC_INIT([ffabi], [0])

AC_LANG(C)

AC_CONFIG_MACRO_DIRS([m4])
AC_ARG_VAR([DESTDIR], [Installation root for maintainer mode])

AC_PROG_CC
AC_PROG_CXX
AC_PROG_INSTALL
AC_CHECK_TOOL([OBJCOPY], [objcopy])

LT_INIT
PKG_PROG_PKG_CONFIG([0.24])
PKG_INSTALLDIR

AC_ARG_ENABLE([gui], AS_HELP_STRING([--disable-gui], [do not build GUI (default is build GUI)]), [ENABLE_GUI=no], [ENABLE_GUI=yes])
AC_ARG_ENABLE([qt5], AS_HELP_STRING([--disable-qt5], [do not use Qt5]))
AC_ARG_ENABLE([noec], AS_HELP_STRING([--enable-noec], [use private ECDSA code (default - use openssl ECDSA if available)]), [NO_EC_DEF=-DFORCE_OPENSSL_NO_EC=1], [NO_EC_DEF=])
AC_ARG_ENABLE([debug], AS_HELP_STRING([--enable-debug], [keep debug symbols in binarfies (default - strip debug symbols)]), [ENABLE_DEBUG=yes], [ENABLE_DEBUG=no])

AC_SUBST([ENABLE_GUI])
AC_SUBST([ENABLE_DEBUG])
AC_SUBST([NO_EC_DEF])
AC_SUBST([DESTDIR])

AC_CHECK_HEADER([zlib.h], [], [AC_MSG_ERROR([zlib library header files not found])])
AC_CHECK_LIB([z], [compress2], [], [AC_MSG_ERROR([zlib library not found])])

AC_CHECK_HEADER([openssl/opensslconf.h], [], [AC_MSG_ERROR([OpenSSL library header files not found])])
AC_CHECK_LIB([crypto], [AES_encrypt], [], [AC_MSG_ERROR([openssl library not found])])

AC_CHECK_HEADER([expat.h], [], [AC_MSG_ERROR([expat library header files not found])])
AC_CHECK_LIB([expat], [XML_ParserCreate], [], [AC_MSG_ERROR([expat library not found])])

PKG_CHECK_MODULES([ffmpeg], [libavcodec libavutil])
AC_CHECK_DECLS([LIBAVCODEC_VERSION_MAJOR], [], [AC_MSG_ERROR([LIBAVCODEC_VERSION_MAJOR is not declared in libavcodec.h])], [#include <libavcodec/avcodec.h>])
AC_MSG_CHECKING([LIBAVCODEC_VERSION_MAJOR])
AC_COMPUTE_INT([LIBAVCODEC_VERSION_MAJOR], [LIBAVCODEC_VERSION_MAJOR], [#include <libavcodec/avcodec.h>], [AC_MSG_ERROR([LIBAVCODEC_VERSION_MAJOR is not known at compile time in libavcodec.h])])
AC_MSG_RESULT([$LIBAVCODEC_VERSION_MAJOR])
AS_IF([test $LIBAVCODEC_VERSION_MAJOR -lt 55], [AC_MSG_ERROR([The libavcodec library is too old. Please get a recent one from http://www.ffmpeg.org])], [])

AC_CHECK_DECLS([avcodec_send_frame], [AC_DEFINE([FFABI_HAVE_AVCODEC_SEND_FRAME],[1],[have avcodec_send_frame])], [], [#include <libavcodec/avcodec.h>])
AC_SUBST([FFABI_HAVE_AVCODEC_SEND_FRAME])
AC_CHECK_TYPE([struct AVChannelLayout], [], [AC_DEFINE([FFABI_HAVE_OLD_CHANNEL_LAYOUT],[1],[no AVChannelLayout])], [#include <libavcodec/avcodec.h>])
AC_SUBST([FFABI_HAVE_OLD_CHANNEL_LAYOUT])

OLD_CPPFLAGS="$CPPFLAGS"
OLD_LIBS="$LIBS"

CPPFLAGS="$ffmpeg_CFLAGS"
LIBS="$ffmpeg_LIBS -lrt"
AC_CHECK_FUNC([av_log_format_line], [AC_DEFINE([FFABI_HAVE_AV_LOG_FORMAT_LINE],[1],[have av_log_format_line])], [])
AC_SUBST([FFABI_HAVE_AV_LOG_FORMAT_LINE])
AC_CHECK_MEMBER([AVCodecParserContext.duration], [AC_DEFINE([FFABI_HAVE_PARSER_DURATION],[1],[have AVCodecParserContext.duration])], [], [#include <libavcodec/avcodec.h>])
AC_SUBST([FFABI_HAVE_PARSER_DURATION])
AC_CHECK_FUNC([av_codec_iterate], [AC_DEFINE([FFABI_HAVE_AV_CODEC_ITERATE],[1],[have av_codec_iterate, no need to call av_codec_register])], [])
AC_SUBST([FFABI_HAVE_AV_CODEC_ITERATE])
CPPFLAGS="$OLD_CPPFLAGS"
LIBS="$OLD_LIBS"

AS_IF([test "x$ENABLE_GUI" != "xno"], [
AS_IF([test "x$enable_qt5" != "xno"], [
PKG_CHECK_MODULES([qt5], [Qt5Core Qt5Gui Qt5Widgets Qt5DBus], [QT_INC="$qt5_CFLAGS";
QT_CFLAGS="-fPIC";
QT_LIB="$qt5_LIBS";
qt5_host_bins=`$PKG_CONFIG --variable host_bins "Qt5Core" 2>/dev/null`;
QT_MOC="$qt5_host_bins/moc";
], AC_MSG_ERROR([Qt library (version 5) is required to build GUI]))
    ])
])
AC_SUBST([QT_INC])
AC_SUBST([QT_CFLAGS])
AC_SUBST([QT_LIB])
AC_SUBST([QT_MOC])

AC_CONFIG_HEADERS([libffabi/src/ffabicfg.h])
AC_CONFIG_FILES([Makefile])
AC_OUTPUT
