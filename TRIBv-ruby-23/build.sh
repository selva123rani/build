#!/bin/sh
#
# ruby update (still segfaults on sparc)
# just can't handle LD_OPTIONS
#
${THOME}/build/dobuild ruby-2.3.3 -P /usr/versions/ruby-2.3 -C ac_cv_func_dl_iterate_phdr=no -L
${THOME}/build/genpkg TRIBv-ruby-23 ruby-2.3.3
