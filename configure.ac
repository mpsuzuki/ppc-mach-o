AC_PREREQ([2.62])
AC_INIT([ppc-mach-o], [0.0.20251227], [https://github.com/mpsuzuki/ppc-mach-o/-/issues])

AC_CHECK_PROGS(INSTALL, [ginstall gnu-install install.gnu install installbsd])
AC_PROG_LN_S
AC_PROG_SED
AC_PROG_AWK

MY_PATH_PROG_GLOB(LLVM_CONFIG, [llvm-config*])
LLVM_CONFIG=`basename "${LLVM_CONFIG}"`

AC_PATH_PROG(GIT, [git])
GIT=`basename "${GIT}"`

AC_SUBST(INSTALL)
AC_SUBST(LN_S)
AC_SUBST(SED)
AC_SUBST(AWK)
AC_SUBST(LLVM_CONFIG)
AC_SUBST(GIT)

AC_ARG_WITH([sysroot],
  [AS_HELP_STRING([--with-sysroot],
    [specify dirname including one or more SDKs, default is /Developer/SDKs/])],
  [SYSROOT="${withval}"],
  [SYSROOT=])

if test "x${SYSROOT}" != x
then
  case "${SYSROOT}" in
  *.sdk)
     SYSROOT=`dirname ${SYSROOT}`
     SYSROOT_SUFFIX=`basename ${SYSROOT}`
     ;;
  *) ;;
  esac
else
  sdk_path=
  if test "x${sdk_path}" = x
  then
    AC_MSG_CHECKING(["xcrun --show-sdk-path" shows sdk path])
    sdk_path=`xcrun --show-sdk-path 2>/dev/null`
    case "x${sdk_path}" in
    x/*)
      AC_MSG_RESULT([${sdk_path}])
      ;;
    *)
      AC_MSG_RESULT([no])
      ;;
    esac
  fi

  if test "x${sdk_path}" = x
  then
    AC_MSG_CHECKING(["xcodebuild -version -sdk macosx" shows sdk path])
    sdk_path=`xcodebuild -version -sdk macosx 2>/dev/null | ${AWK} '/^Path:/{print $2}'`
    case "x${sdk_path}" in
    x/*)
      AC_MSG_RESULT([${sdk_path}])
      ;;
    *)
      AC_MSG_RESULT([no])
      ;;
    esac
  fi
fi

AC_ARG_WITH([platform],
  [AS_HELP_STRING([--with-platform={MacOSX,iPhoneOS,AppleTVOS,WatchOS,XROS}],
    [specify platform to locate SDK subdir, currently only "MacOSX" is tested])],
  [APPLE_PLATFORM="${withval}"],
  [APPLE_PLATFORM="MacOSX"])

if test "x${SYSROOT}" != x
then
  :
elif test "x${sdk_path}" != x
then
  SYSROOT=`dirname ${sdk_path}`
else
  AC_MSG_CHECKING([for SDKs in "xcode-select -print-path"])
  xcode_developer_dir=`xcode-select -print-path`
  SYSROOT=`xcode-select -print-path`/Platforms/${APPLE_PLATFORM}.platform/Developer/SDKs/
fi

sdks=`cd ${SYSROOT}/ && echo * | tr ' ' '\n' | sort | tr '\n' '\t'`
for sdk in ${sdks} "none"
do
  case "${sdk}" in
  MacOSX10.[[0-5]].*sdk|MacOSX10.[[0-5]][a-z].*sdk)
    echo ${sdk}
    SYSROOT_SUFFIX=${sdk} ;;
  *) ;;
  esac
done

AC_ARG_WITH([sysroot-suffix],
  [AS_HELP_STRING([--with-sysroot-suffix],
    [specify default SDK suffix, newest SDK before MacOSX10.6 is chosen from available SDKs])],
  [
    case `echo ${sdks} | tr '\t' '/'` in
    *${withval}*)
      SYSROOT_SUFFIX=${withval}
      ;;
    *)
      AC_MSG_ERROR([Cannot find specified SDK in ${SYSROOT}])
      ;;
    esac
  ],[])

if test "x${SYSROOT_SUFFIX}" = x
then
  AC_MSG_ERROR([Cannot find any SDK < MacOSX10.6.sdk in ${SYSROOT}])
else
  AC_MSG_RESULT([SYSROOT = ${SYSROOT}])
  AC_MSG_RESULT([SYSROOT_SUFFIX = ${SYSROOT_SUFFIX}])
fi

AC_SUBST(SYSROOT)
AC_SUBST(SYSROOT_SUFFIX)

AC_CONFIG_FILES([GNUmakefile])
AC_OUTPUT
