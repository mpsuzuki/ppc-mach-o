AC_PREREQ([2.62])
AC_INIT([ppc-mach-o], [0.0.20251227], [https://github.com/mpsuzuki/ppc-mach-o/-/issues])

MY_PATH_PROG_GLOB(LLVM_CONFIG, [llvm-config*])
LLVM_CONFIG=`basename "${LLVM_CONFIG}"`
AC_PATH_PROG(GIT, [git])
GIT=`basename "${GIT}"`
AC_SUBST(LLVM_CONFIG)
AC_SUBST(GIT)

AC_CONFIG_FILES([Makefile])
AC_OUTPUT
