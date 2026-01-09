#!/bin/sh
git submodule update --init --depth 1 ppc-apple-gcc
(cd ppc-apple-gcc && git submodule update --init --depth 1 libstdc++-v3)
git submodule update --init --depth 1 ppc-libunwind
git submodule update --init

(cd ppc-ld64 && autoconf)
aclocal -I. --force
autoconf
