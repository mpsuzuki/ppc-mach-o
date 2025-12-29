#!/bin/sh
(cd ppc-apple-gcc && git submodule deinit -f -- libstdc++-v3)
git submodule deinit -f -- ppc-apple-gcc
git submodule deinit -f -- ppc-libunwind
git submodule deinit -f -- ppc-ld64
git submodule deinit -f -- ppc-cctools
git submodule deinit -f -- vers_string
rm -rf ppc-apple-gcc
rm -rf ppc-libunwind
rm -rf ppc-ld64
rm -rf ppc-cctools
rm -rf vers_string
rm -rf .git/modules/ppc-apple-gcc/modules/libstdc++-v3
rm -rf .git/modules/ppc-apple-gcc
rm -rf .git/modules/ppc-libunwind
rm -rf .git/modules/ppc-ld64
rm -rf .git/modules/ppc-cctools
rm -rf .git/modules/vers_string
mkdir ppc-apple-gcc
mkdir ppc-libunwind
mkdir ppc-ld64
mkdir ppc-cctools
mkdir vers_string
