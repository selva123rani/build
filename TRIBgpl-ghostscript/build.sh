#!/bin/sh
#
# Update ghostscript
# Force more system libraries, clean documentation up, disable other
# things to keep size down to reasonable levels.
#
# see the BLFS documentation, we build the same way
#  http://www.linuxfromscratch.org/blfs/view/svn/pst/gs.html
#
${THOME}/build/dobuild ghostscript-9.19 -C "--disable-compile-inits --with-system-libtiff --disable-gtk --disable-dbus --disable-cups --enable-dynamic LIBS=-lz"
cd ghostscript-9.19
gmake -j4 so
rm -fr /tmp/ags
gmake DESTDIR=/tmp/ags install
gmake DESTDIR=/tmp/ags soinstall
ginstall -v -m644 base/*.h /tmp/ags/usr/include/ghostscript/
mkdir -p /tmp/ags/usr/share/ghostscript
cd /tmp/ags/usr/share/ghostscript
${THOME}/build/unpack ghostscript-fonts-std-8.11
${THOME}/build/unpack gnu-gs-fonts-other-6.0
rm 9.19/doc/*.*
cd
${THOME}/build/create_pkg TRIBgpl-ghostscript /tmp/ags
rm -fr /tmp/ags
