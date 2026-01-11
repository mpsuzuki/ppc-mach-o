#!/bin/sh

RESOLVEPATH=@RESOLVEPATH@
if test -x "${RESOLVEPATH}"
then
  :
elif command -v resolvepath >/dev/null 2>&1
then
  RESOLVEPATH=resolvepath
else
  echo "This wrapper script requires 'resolvepath' command" 1>&2
  exit 1
fi

path_me=`${RESOLVEPATH} $0`
dir_bin=`dirname "${path_me}"`
dir_prefix=`dirname "${dir_bin}"`
dir_libexec="${dir_prefix}"/libexec/cctools
path_cmd="${dir_libexec}"/@CMD@

"${path_cmd}" "$@"
