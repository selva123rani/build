#!/bin/sh
#
# (no pcre in the install environment)
#
env POD2MAN=/usr/perl5/bin/pod2man ${THOME}/build/dobuild wget-1.18 -C '--with-ssl=openssl --disable-pcre'
${THOME}/build/genpkg TRIBwget wget-1.18
