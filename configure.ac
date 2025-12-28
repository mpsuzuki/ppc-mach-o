AC_PREREQ([2.62])
AC_INIT([ppc-mach-o], [0.0.20251227], [https://github.com/mpsuzuki/ppc-mach-o/-/issues])

AC_CHECK_PROGS(INSTALL, [ginstall gnu-install install.gnu install installbsd])
AC_PROG_MKDIR_P
AC_PROG_LN_S
AC_PROG_SED
AC_PROG_AWK

MY_PATH_PROG_GLOB(LLVM_CONFIG, [llvm-config*])
LLVM_CONFIG=`basename "${LLVM_CONFIG}"`

AC_PATH_PROG(GIT, [git])
GIT=`basename "${GIT}"`

AC_SUBST(INSTALL)
AC_SUBST(MKDIR_P)
AC_SUBST(LN_S)
AC_SUBST(SED)
AC_SUBST(AWK)
AC_SUBST(LLVM_CONFIG)
AC_SUBST(GIT)

AC_CONFIG_FILES([GNUmakefile])
AC_OUTPUT
