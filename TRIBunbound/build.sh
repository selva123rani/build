#!/bin/sh
#
#
#
${THOME}/build/dobuild unbound-1.5.10 -C "--without-libevent --sysconfdir=/etc" -J 1
${THOME}/build/genpkg TRIBunbound unbound-1.5.10
