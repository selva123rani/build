#!/bin/sh
#
env CPPFLAGS="-D BSD_COMP" ${THOME}/build/dobuild mtr-0.87
${THOME}/build/genpkg TRIBmtr mtr-0.87
