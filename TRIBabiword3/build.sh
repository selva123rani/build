#!/bin/sh
#
env CPPFLAGS=-Wno-deprecated-declarations CFLAGS=-Wno-deprecated-declarations ${THOME}/build/dobuild abiword-3.0.1
${THOME}/build/genpkg TRIBabiword3 abiword-3.0.1
