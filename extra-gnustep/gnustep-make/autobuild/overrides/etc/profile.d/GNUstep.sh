if [ -n "$ZSH_VERSION" ]; then
  if ( setopt | grep shwordsplit > /dev/null ); then :; else
    setopt shwordsplit
    GS_ZSH_NEED_TO_RESTORE_SET=yes
  fi
fi
GNUSTEP_MAKE_STRICT_V2_MODE=yes
if [ -z "$GNUSTEP_CONFIG_FILE" ]; then
  GNUSTEP_CONFIG_FILE=/etc/GNUstep/GNUstep.conf
else
  GNUSTEP_KEEP_CONFIG_FILE=yes
fi
if [ -z "$GNUSTEP_USER_CONFIG_FILE" ]; then
  GNUSTEP_USER_CONFIG_FILE=.GNUstep.conf
else
  GNUSTEP_KEEP_USER_CONFIG_FILE=yes
fi
if [ -f "$GNUSTEP_CONFIG_FILE" ]; then
  . "$GNUSTEP_CONFIG_FILE"
fi
GNUSTEP_HOME=~
if [ -n "$GNUSTEP_USER_CONFIG_FILE" ]; then
  case "$GNUSTEP_USER_CONFIG_FILE" in 
    /*) # An absolute path
        if [ -f "$GNUSTEP_USER_CONFIG_FILE" ]; then
          . "$GNUSTEP_USER_CONFIG_FILE"
        fi;;
     *) # Something else
        if [ -f "$GNUSTEP_HOME/$GNUSTEP_USER_CONFIG_FILE" ]; then
          . "$GNUSTEP_HOME/$GNUSTEP_USER_CONFIG_FILE"
        fi;;
  esac
fi
if [ "$GNUSTEP_MAKE_STRICT_V2_MODE" = "yes" ]; then
  unset GNUSTEP_SYSTEM_ROOT
  unset GNUSTEP_LOCAL_ROOT
  unset GNUSTEP_NETWORK_ROOT
else
  if [ -z "$GNUSTEP_SYSTEM_ROOT" ]; then
    GNUSTEP_SYSTEM_ROOT=/usr/System
  fi
  if [ -z "$GNUSTEP_LOCAL_ROOT" ]; then
    GNUSTEP_LOCAL_ROOT=/usr/Local
  fi
  if [ -z "$GNUSTEP_NETWORK_ROOT" ]; then
    GNUSTEP_NETWORK_ROOT=/usr/Network
  fi
  export GNUSTEP_SYSTEM_ROOT GNUSTEP_LOCAL_ROOT GNUSTEP_NETWORK_ROOT
fi
if [ "$GNUSTEP_MAKE_STRICT_V2_MODE" = "yes" ]; then
  unset GNUSTEP_FLATTENED
else
  GNUSTEP_FLATTENED=yes
  export GNUSTEP_FLATTENED
fi
GNUSTEP_IS_FLATTENED=yes
if [ -z "$LIBRARY_COMBO" ]; then
  LIBRARY_COMBO=gnu-gnu-gnu
fi
if [ ! "$GNUSTEP_MAKE_STRICT_V2_MODE" = "yes" ]; then
  export GNUSTEP_IS_FLATTENED LIBRARY_COMBO
fi
if [ -z "$GNUSTEP_MAKEFILES" ]; then
  GNUSTEP_MAKEFILES=/usr/share/GNUstep/Makefiles
fi
export GNUSTEP_MAKEFILES
if [ "$GNUSTEP_MAKE_STRICT_V2_MODE" = "yes" ]; then
  unset GNUSTEP_USER_DIR
  unset GNUSTEP_USER_ROOT
else
  if [ -z "$GNUSTEP_USER_DIR" ]; then
    GNUSTEP_USER_DIR=GNUstep
  fi
  case "$GNUSTEP_USER_DIR" in 
    /*) # An absolute path
        GNUSTEP_USER_ROOT="$GNUSTEP_USER_DIR";;
     *) # Something else
        GNUSTEP_USER_ROOT="$GNUSTEP_HOME/$GNUSTEP_USER_DIR";;
  esac
  unset GNUSTEP_USER_DIR
  export GNUSTEP_USER_ROOT
fi
if [ -z "" ]; then
  GNUSTEP_HOST=x86_64-unknown-linux-gnu
  GNUSTEP_HOST_CPU=x86_64
  GNUSTEP_HOST_VENDOR=unknown
  GNUSTEP_HOST_OS=linux-gnu
fi
if [ -z "$GNUSTEP_HOST" ]; then
  tmpdir=`pwd`; cd /tmp
  GNUSTEP_HOST=`$GNUSTEP_MAKEFILES/config.guess`
  GNUSTEP_HOST=`$GNUSTEP_MAKEFILES/config.sub $GNUSTEP_HOST`
  cd "$tmpdir"
  unset tmpdir
fi
if [ -z "$GNUSTEP_HOST_CPU" ]; then
  GNUSTEP_HOST_CPU=`$GNUSTEP_MAKEFILES/cpu.sh $GNUSTEP_HOST`
  GNUSTEP_HOST_CPU=`$GNUSTEP_MAKEFILES/clean_cpu.sh $GNUSTEP_HOST_CPU`
fi
if [ -z "$GNUSTEP_HOST_VENDOR" ]; then
  GNUSTEP_HOST_VENDOR=`$GNUSTEP_MAKEFILES/vendor.sh $GNUSTEP_HOST`
  GNUSTEP_HOST_VENDOR=`$GNUSTEP_MAKEFILES/clean_vendor.sh $GNUSTEP_HOST_VENDOR`
fi
if [ -z "$GNUSTEP_HOST_OS" ]; then 
  GNUSTEP_HOST_OS=`$GNUSTEP_MAKEFILES/os.sh $GNUSTEP_HOST`
  GNUSTEP_HOST_OS=`$GNUSTEP_MAKEFILES/clean_os.sh $GNUSTEP_HOST_OS`
fi
if [ ! "$GNUSTEP_MAKE_STRICT_V2_MODE" = "yes" ]; then
  export GNUSTEP_HOST GNUSTEP_HOST_CPU GNUSTEP_HOST_VENDOR GNUSTEP_HOST_OS
fi
. $GNUSTEP_MAKEFILES/filesystem.sh
unset GNUSTEP_HOME
fixup_paths=no
path_check=`echo "$GNUSTEP_MAKEFILES" | sed 's|^[a-zA-Z]:/.*$||'`
if [ -z "$path_check" ]; then
  fixup_paths=yes
fi
unset path_check
if [ "$GNUSTEP_MAKE_STRICT_V2_MODE" = "yes" ]; then
  unset GNUSTEP_PATHLIST
else
  if [ -z "$GNUSTEP_PATHLIST" ]; then
   GNUSTEP_PATHLIST=`$GNUSTEP_MAKEFILES/print_unique_pathlist.sh "$GNUSTEP_USER_ROOT" "$GNUSTEP_LOCAL_ROOT" "$GNUSTEP_NETWORK_ROOT" "$GNUSTEP_SYSTEM_ROOT" $fixup_paths`
   export GNUSTEP_PATHLIST
  fi
fi
GNUSTEP_TOOLS_PATHLIST=`$GNUSTEP_MAKEFILES/print_unique_pathlist.sh "$GNUSTEP_USER_TOOLS" "$GNUSTEP_LOCAL_TOOLS" "$GNUSTEP_NETWORK_TOOLS" "$GNUSTEP_SYSTEM_TOOLS" $fixup_paths`
for dir in "$GNUSTEP_SYSTEM_ADMIN_TOOLS" "$GNUSTEP_NETWORK_ADMIN_TOOLS" "$GNUSTEP_LOCAL_ADMIN_TOOLS" "$GNUSTEP_USER_ADMIN_TOOLS"; do
  if [ -d "$dir"  -a  -w "$dir" ]; then
    if (echo ":${GNUSTEP_TOOLS_PATHLIST}:" \
      |grep -v ":${dir}:" >/dev/null); then
      GNUSTEP_TOOLS_PATHLIST="$dir:$GNUSTEP_TOOLS_PATHLIST"
    fi
  fi
done
old_IFS="$IFS"
IFS=:
for dir in $GNUSTEP_TOOLS_PATHLIST; do
  if [ "$GNUSTEP_IS_FLATTENED" = "no" ]; then
    path_fragment="$dir:$dir/${GNUSTEP_HOST_CPU}/${GNUSTEP_HOST_OS}/${LIBRARY_COMBO}:$dir/${GNUSTEP_HOST_CPU}/${GNUSTEP_HOST_OS}"
  else
    path_fragment="$dir"
  fi
  if [ -z "$PATH" ]; then
    PATH="$path_fragment"
  else
    if ( echo ":${PATH}:"\
      |grep -v ":${path_fragment}:" >/dev/null ); then
      PATH="${path_fragment}:${PATH}"
    fi
  fi
done
IFS="$old_IFS"
unset old_IFS
unset dir
unset path_fragment
unset GNUSTEP_TOOLS_PATHLIST
export PATH
GNUSTEP_LIBRARIES_PATHLIST=`$GNUSTEP_MAKEFILES/print_unique_pathlist.sh "$GNUSTEP_USER_LIBRARIES" "$GNUSTEP_LOCAL_LIBRARIES" "$GNUSTEP_NETWORK_LIBRARIES" "$GNUSTEP_SYSTEM_LIBRARIES" $fixup_paths`
old_IFS="$IFS"
IFS=:
  for dir in $GNUSTEP_LIBRARIES_PATHLIST; do
    if [ "$dir" = "/usr/lib" ]; then
	    continue
    fi
    if [ "$GNUSTEP_IS_FLATTENED" = "yes" ]; then
      path_fragment="$dir"
    else
      path_fragment="$dir/$GNUSTEP_HOST_CPU/$GNUSTEP_HOST_OS/$LIBRARY_COMBO:$dir/$GNUSTEP_HOST_CPU/$GNUSTEP_HOST_OS"
    fi
    case "$GNUSTEP_HOST_OS" in
      *nextstep4* | *darwin*)
        if [ -z "$DYLD_LIBRARY_PATH" ]; then
          DYLD_LIBRARY_PATH="$path_fragment"
        else
          if ( echo ":${DYLD_LIBRARY_PATH}:"\
	    |grep -v ":${path_fragment}:" >/dev/null ); then
	    DYLD_LIBRARY_PATH="$path_fragment:$DYLD_LIBRARY_PATH"
          fi
        fi
        export DYLD_LIBRARY_PATH;;
      *hpux*)
        if [ -z "$SHLIB_PATH" ]; then
          SHLIB_PATH="$path_fragment"
        else
          if ( echo ":${SHLIB_PATH}:"\
	    |grep -v ":${path_fragment}:" >/dev/null ); then
	    SHLIB_PATH="$path_fragment:$SHLIB_PATH"
          fi
        fi
        export SHLIB_PATH;
        if [ -z "$LD_LIBRARY_PATH" ]; then
          LD_LIBRARY_PATH="$path_fragment"
        else
          if ( echo ":${LD_LIBRARY_PATH}:"\
	    |grep -v ":${path_fragment}:" >/dev/null ); then
	    LD_LIBRARY_PATH="$path_fragment:$LD_LIBRARY_PATH"
          fi
        fi
        export LD_LIBRARY_PATH;;
      *)
        if [ -z "$LD_LIBRARY_PATH" ]; then
          LD_LIBRARY_PATH="$path_fragment"
        else
          if ( echo ":${LD_LIBRARY_PATH}:"\
	    |grep -v ":${path_fragment}:" >/dev/null ); then
	    LD_LIBRARY_PATH="$path_fragment:$LD_LIBRARY_PATH"
          fi
        fi
        export LD_LIBRARY_PATH;;
    esac
  done
IFS="$old_IFS"
unset old_IFS
unset dir
unset path_fragment
unset GNUSTEP_LIBRARIES_PATHLIST
case "$GNUSTEP_HOST_OS" in
  *darwin*)
    GNUSTEP_FRAMEWORKS_PATHLIST=`$GNUSTEP_MAKEFILES/print_unique_pathlist.sh "$GNUSTEP_USER_LIBRARY/Frameworks" "$GNUSTEP_LOCAL_LIBRARY/Frameworks" "$GNUSTEP_NETWORK_LIBRARY/Frameworks" "$GNUSTEP_SYSTEM_LIBRARY/Frameworks" $fixup_paths`
    old_IFS="$IFS"
    IFS=:
    for dir in $GNUSTEP_FRAMEWORKS_PATHLIST; do
      path_fragment="$dir"
    
      if [ -z "$DYLD_FRAMEWORK_PATH" ]; then
        DYLD_FRAMEWORK_PATH="$path_fragment"
      else
        if ( echo ":${DYLD_FRAMEWORK_PATH}:"\
	  |grep -v ":${path_fragment}:" >/dev/null ); then
          DYLD_FRAMEWORK_PATH="$path_fragment:$DYLD_FRAMEWORK_PATH"
        fi
      fi
      export DYLD_FRAMEWORK_PATH
    done
    IFS="$old_IFS"
    unset old_IFS
    unset dir
    unset path_fragment
    unset GNUSTEP_FRAMEWORKS_PATHLIST
    ;;
  *)
    ;;
esac
GNUSTEP_LIBRARY_PATHLIST=`$GNUSTEP_MAKEFILES/print_unique_pathlist.sh "$GNUSTEP_USER_LIBRARY" "$GNUSTEP_LOCAL_LIBRARY" "$GNUSTEP_NETWORK_LIBRARY" "$GNUSTEP_SYSTEM_LIBRARY" $fixup_paths`
old_IFS="$IFS"
IFS=:
for dir in $GNUSTEP_LIBRARY_PATHLIST; do
  path_fragment="$dir/Libraries/Java"
  if [ -z "$CLASSPATH" ]; then
    CLASSPATH="$path_fragment"
  else
    if ( echo ":${CLASSPATH}:"\
      |grep -v ":${path_fragment}:" >/dev/null ); then
      CLASSPATH="$path_fragment:$CLASSPATH"
    fi
  fi
  path_fragment="$dir/Libraries/Guile"
  if [ -z "$GUILE_LOAD_PATH" ]; then
    GUILE_LOAD_PATH="$path_fragment"
  else
    if ( echo ":${GUILE_LOAD_PATH}:"\
      |grep -v ":${path_fragment}:" >/dev/null ); then
      GUILE_LOAD_PATH="$path_fragment:$GUILE_LOAD_PATH"
    fi
  fi
done
IFS="$old_IFS"
unset old_IFS
unset dir
unset path_fragment
unset GNUSTEP_LIBRARY_PATHLIST
export CLASSPATH
export GUILE_LOAD_PATH
GNUSTEP_INFO_PATHLIST=`$GNUSTEP_MAKEFILES/print_unique_pathlist.sh "$GNUSTEP_USER_DOC_INFO" "$GNUSTEP_LOCAL_DOC_INFO" "$GNUSTEP_NETWORK_DOC_INFO" "$GNUSTEP_SYSTEM_DOC_INFO" $fixup_paths`
old_IFS="$IFS"
IFS=:
for dir in $GNUSTEP_INFO_PATHLIST; do
  if [ -z "$INFOPATH" ]; then
    INFOPATH="${dir}:"
  else
    if ( echo ":${INFOPATH}:"\
      |grep -v ":${dir}:" >/dev/null ); then
      INFOPATH="$INFOPATH:${dir}:"
    fi
  fi
done
IFS="$old_IFS"
unset old_IFS
unset dir
unset GNUSTEP_INFO_PATHLIST
export INFOPATH
if [ -n "$GNUSTEP_SH_EXPORT_ALL_VARIABLES" ]; then
  export GNUSTEP_MAKE_STRICT_V2_MODE
  unset GNUSTEP_KEEP_CONFIG_FILE GNUSTEP_KEEP_USER_CONFIG_FILE
  export GNUSTEP_CONFIG_FILE GNUSTEP_USER_CONFIG_FILE
  export GNUSTEP_USER_DEFAULTS_DIR
  export GNUSTEP_IS_FLATTENED LIBRARY_COMBO
  export GNUSTEP_HOST GNUSTEP_HOST_CPU GNUSTEP_HOST_VENDOR GNUSTEP_HOST_OS
  export GNUSTEP_SYSTEM_APPS GNUSTEP_SYSTEM_ADMIN_APPS GNUSTEP_SYSTEM_WEB_APPS GNUSTEP_SYSTEM_TOOLS GNUSTEP_SYSTEM_ADMIN_TOOLS 
  export GNUSTEP_SYSTEM_LIBRARY GNUSTEP_SYSTEM_HEADERS GNUSTEP_SYSTEM_LIBRARIES
  export GNUSTEP_SYSTEM_DOC GNUSTEP_SYSTEM_DOC_MAN GNUSTEP_SYSTEM_DOC_INFO
  export GNUSTEP_NETWORK_APPS GNUSTEP_NETWORK_ADMIN_APPS GNUSTEP_NETWORK_WEB_APPS GNUSTEP_NETWORK_TOOLS GNUSTEP_NETWORK_ADMIN_TOOLS 
  export GNUSTEP_NETWORK_LIBRARY GNUSTEP_NETWORK_HEADERS GNUSTEP_NETWORK_LIBRARIES
  export GNUSTEP_NETWORK_DOC GNUSTEP_NETWORK_DOC_MAN GNUSTEP_NETWORK_DOC_INFO
  export GNUSTEP_LOCAL_APPS GNUSTEP_LOCAL_ADMIN_APPS GNUSTEP_LOCAL_WEB_APPS GNUSTEP_LOCAL_TOOLS GNUSTEP_LOCAL_ADMIN_TOOLS 
  export GNUSTEP_LOCAL_LIBRARY GNUSTEP_LOCAL_HEADERS GNUSTEP_LOCAL_LIBRARIES
  export GNUSTEP_LOCAL_DOC GNUSTEP_LOCAL_DOC_MAN GNUSTEP_LOCAL_DOC_INFO
  export GNUSTEP_USER_APPS GNUSTEP_USER_ADMIN_APPS GNUSTEP_USER_WEB_APPS GNUSTEP_USER_TOOLS GNUSTEP_USER_ADMIN_TOOLS 
  export GNUSTEP_USER_LIBRARY GNUSTEP_USER_HEADERS GNUSTEP_USER_LIBRARIES
  export GNUSTEP_USER_DOC GNUSTEP_USER_DOC_MAN GNUSTEP_USER_DOC_INFO
  export GNUSTEP_SYSTEM_USERS_DIR GNUSTEP_LOCAL_USERS_DIR GNUSTEP_NETWORK_USERS_DIR
else
  if [ "$GNUSTEP_MAKE_STRICT_V2_MODE" = "yes" ]; then
    unset GNUSTEP_IS_FLATTENED
    unset LIBRARY_COMBO
    unset GNUSTEP_HOST
    unset GNUSTEP_HOST_CPU
    unset GNUSTEP_HOST_VENDOR
    unset GNUSTEP_HOST_OS
  fi
  unset GNUSTEP_MAKE_STRICT_V2_MODE
  if [ -z "$GNUSTEP_KEEP_CONFIG_FILE" ]; then
    unset GNUSTEP_CONFIG_FILE
  fi
  unset GNUSTEP_KEEP_CONFIG_FILE 
  if [ -z "$GNUSTEP_KEEP_USER_CONFIG_FILE" ]; then
    unset GNUSTEP_USER_CONFIG_FILE
  fi
  unset GNUSTEP_KEEP_USER_CONFIG_FILE
  unset GNUSTEP_USER_DEFAULTS_DIR
  unset GNUSTEP_SYSTEM_APPS 
  unset GNUSTEP_SYSTEM_ADMIN_APPS 
  unset GNUSTEP_SYSTEM_WEB_APPS 
  unset GNUSTEP_SYSTEM_TOOLS 
  unset GNUSTEP_SYSTEM_ADMIN_TOOLS 
  unset GNUSTEP_SYSTEM_LIBRARY
  unset GNUSTEP_SYSTEM_HEADERS 
  unset GNUSTEP_SYSTEM_LIBRARIES 
  unset GNUSTEP_SYSTEM_DOC 
  unset GNUSTEP_SYSTEM_DOC_MAN
  unset GNUSTEP_SYSTEM_DOC_INFO
  unset GNUSTEP_NETWORK_APPS 
  unset GNUSTEP_NETWORK_ADMIN_APPS 
  unset GNUSTEP_NETWORK_WEB_APPS 
  unset GNUSTEP_NETWORK_TOOLS 
  unset GNUSTEP_NETWORK_ADMIN_TOOLS 
  unset GNUSTEP_NETWORK_LIBRARY
  unset GNUSTEP_NETWORK_HEADERS 
  unset GNUSTEP_NETWORK_LIBRARIES 
  unset GNUSTEP_NETWORK_DOC 
  unset GNUSTEP_NETWORK_DOC_MAN
  unset GNUSTEP_NETWORK_DOC_INFO
  unset GNUSTEP_LOCAL_APPS 
  unset GNUSTEP_LOCAL_ADMIN_APPS 
  unset GNUSTEP_LOCAL_WEB_APPS 
  unset GNUSTEP_LOCAL_TOOLS 
  unset GNUSTEP_LOCAL_ADMIN_TOOLS 
  unset GNUSTEP_LOCAL_LIBRARY
  unset GNUSTEP_LOCAL_HEADERS 
  unset GNUSTEP_LOCAL_LIBRARIES 
  unset GNUSTEP_LOCAL_DOC 
  unset GNUSTEP_LOCAL_DOC_MAN
  unset GNUSTEP_LOCAL_DOC_INFO
  unset GNUSTEP_USER_APPS 
  unset GNUSTEP_USER_ADMIN_APPS 
  unset GNUSTEP_USER_WEB_APPS 
  unset GNUSTEP_USER_TOOLS 
  unset GNUSTEP_USER_ADMIN_TOOLS 
  unset GNUSTEP_USER_LIBRARY
  unset GNUSTEP_USER_HEADERS 
  unset GNUSTEP_USER_LIBRARIES 
  unset GNUSTEP_USER_DOC 
  unset GNUSTEP_USER_DOC_MAN
  unset GNUSTEP_USER_DOC_INFO
  unset GNUSTEP_SYSTEM_USERS_DIR
  unset GNUSTEP_LOCAL_USERS_DIR
  unset GNUSTEP_NETWORK_USERS_DIR
fi
if [ -n "$GS_ZSH_NEED_TO_RESTORE_SET" ]; then
  unsetopt shwordsplit
fi
