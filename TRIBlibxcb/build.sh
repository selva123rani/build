#!/bin/sh
#
# [need to uprev in stages, needed an interim build with libxcb-1.10]
# xcb requires xsltproc - install that from OI if necessary.
#
#
# for sparc, need to remove any odd bis of xcb that happen to come from
# the opensxce SUNWxwplt package
#
# /usr/sbin/removef SUNWxwplt /usr/lib/libxcb.so /usr/lib/libxcb.so.1 /usr/lib/sparcv9/libxcb.so /usr/lib/sparcv9/libxcb.so.1
# /bin/rm -f /usr/lib/libxcb.so /usr/lib/libxcb.so.1 /usr/lib/sparcv9/libxcb.so /usr/lib/sparcv9/libxcb.so.1
# /usr/sbin/removef -f SUNWxwplt
#
# also, some parts need prior parts installed, so need to build a partial
# package and install it before moving on
#
${THOME}/build/dobuild xcb-proto-1.11
${THOME}/build/dobuild libpthread-stubs-0.3
# [install]
${THOME}/build/dobuild -64 libxcb-1.11.1
# [install]
${THOME}/build/dobuild -64 xcb-util-0.4.0
# [install]
${THOME}/build/dobuild -64 xcb-util-wm-0.4.1
${THOME}/build/dobuild -64 xcb-util-image-0.4.0
${THOME}/build/dobuild -64 xcb-util-keysyms-0.4.0
${THOME}/build/dobuild -64 xcb-util-renderutil-0.3.9
# [install]
${THOME}/build/dobuild -64 xcb-util-cursor-0.1.2
rm -fr /tmp/xci
foreach dir ( xcb-proto-1.11 libpthread-stubs-0.3 libxcb-1.11.1-64bit libxcb-1.11.1 xcb-util-0.4.0-64bit xcb-util-0.4.0 xcb-util-wm-0.4.1-64bit xcb-util-wm-0.4.1 xcb-util-image-0.4.0-64bit xcb-util-image-0.4.0 xcb-util-keysyms-0.4.0-64bit xcb-util-keysyms-0.4.0 xcb-util-renderutil-0.3.9-64bit xcb-util-renderutil-0.3.9 xcb-util-cursor-0.1.2-64bit xcb-util-cursor-0.1.2 )
cd $dir
gmake install DESTDIR=/tmp/xci
cd ..
end
rm -fr /tmp/pct/TRIBlibxcb*
${THOME}/build/create_pkg TRIBlibxcb /tmp/xci
