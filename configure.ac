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

MY_XCODE_SYSROOT

AC_SUBST(SYSROOT)
AC_SUBST(SYSROOT_SUFFIX)

AC_PATH_PROG(MD, [md])
MD_SUBST=
if test "x${MD}" != x
then
  MD_PATH=`dirname ${MD}`
else
  MD_PATH='$(PPC_PREFIX)/bin'
fi
AC_SUBST(MD_PATH)

AC_CONFIG_FILES([GNUmakefile])
AC_OUTPUT
