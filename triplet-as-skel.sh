#!/bin/sh

if ! command -v resolvepath >/dev/null 2>&1
then
  echo "This wrapper script requires 'resolvepath' command" 1>&2
  exit 1
fi

path_me=`resolvepath $0`
base_me="${0##*/}"
bindir="${path_me%/*}"
prefix="${bindir%/*}"
libexecdir="${prefix}"/libexec
path_cmd="${@CMD_DIR@}"/as

# ----------------------------------------------------
# check the cases that no arch specification is needed.

need_arch=yes
for _opt in $@
do
  case "${_opt}" in
    -v|--version|-arch)
       need_arch=no
       ;;
    *) ;;
  esac
done

# ----------------------------------------------------
# check the arch from the first token of the triplet
# and normalize it

cpu="${base_me%%-*}"
case "${cpu}" in
ppc64*|powerpc64*) cpu=ppc64  ;;
ppc*|powerpc*)     cpu=ppc    ;;
i[2-9]86)          cpu=i386   ;;
x86_64|amd64)      cpu=x86_64 ;;
i860*)             cpu=i860   ;;
arm*64|aarch*64)   cpu=arm64  ;; # unsupported
arm*)              cpu=arm    ;;
hppa*|pa*risc*)    cpu=hppa   ;;
m68*)              cpu=m68k   ;;
m88*)              cpu=m88k   ;;
sparc*)            cpu=sparc  ;;
*) ;;
esac

# ----------------------------------------------------
# check the arch from the first token of the triplet
#
if test "x${need_arch}" = xno
then
  "${path_cmd}" "$@"
else
  "${path_cmd}" -arch "${cpu}" "$@"
fi
