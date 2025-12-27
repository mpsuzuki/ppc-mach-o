#!/bin/sh
git submodule update --init

aclocal -I. --force
autoconf
