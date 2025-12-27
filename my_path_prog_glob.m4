dnl
dnl MY_PATH_PROG_GLOB(<var_name>, <glob_pattern>)
dnl
dnl  search a command matching with a sh glob pattern
dnl  in PATH environment. The first result would be
dnl  returned, but no control how to sort the
dnl  matched candidates in same directory.
dnl
dnl  $1 = variable name to store the result
dnl  $2 = sh glob pattern to search
dnl
AC_DEFUN([MY_PATH_PROG_GLOB],[
  AC_MSG_CHECKING([for command matching with $2])
  [$1]=""
  for d_esc in `echo ${PATH} | sed 's/%/%25/g;s/ /%20/g' | tr ':' '\n'`
  do
    d_raw=`echo "${d_esc}" | sed 's/%20/ /g;s/%25/%/g'`
    for f in "${d_raw}"/[$2]
    do
      if test -x "${f}"
      then
        [$1]="${f}"
        break
      fi
    done
    if test ! -z "${$1}"
    then
      break
    fi
  done
  if test ! -z "${$1}"
  then
    AC_MSG_RESULT(${$1})
  else
    AC_MSG_RESULT([no])
  fi
])
