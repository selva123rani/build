#!/bin/sh
#
# this builds the mysql and postgres packages too
#
${THOME}/build/unpack icinga2-2.5.4
cd icinga2-2.5.4
mkdir build
cd build
gsed -i '/gc-sections/d' ../CMakeLists.txt
env PostgreSQL_ROOT=/opt/tribblix/postgres96 MYSQL_DIR=/opt/tribblix/mysql MYSQL_INCLUDE_DIR=/opt/tribblix/mysql/include/mysql cmake .. -DCMAKE_INSTALL_PREFIX=/opt/tribblix/icinga2 -DCMAKE_INSTALL_SYSCONFDIR=/opt/tribblix/icinga2/etc -DCMAKE_C_FLAGS=-pthread -DCMAKE_CXX_FLAGS=-pthread
gmake -j 8
rm -fr /tmp/ii /tmp/iip /tmp/iim
gmake install DESTDIR=/tmp/ii
mkdir -p /tmp/iip/opt/tribblix/icinga2/share /tmp/iip/opt/tribblix/icinga2/lib/icinga2 /tmp/iip/opt/tribblix/icinga2/etc/icinga2/features-available
mkdir -p /tmp/iim/opt/tribblix/icinga2/share /tmp/iim/opt/tribblix/icinga2/lib/icinga2 /tmp/iim/opt/tribblix/icinga2/etc/icinga2/features-available
mv /tmp/ii/opt/tribblix/icinga2/share/icinga2-ido-pgsql /tmp/iip/opt/tribblix/icinga2/share
mv /tmp/ii/opt/tribblix/icinga2/lib/icinga2/libdb_ido_pgsql.so /tmp/iip/opt/tribblix/icinga2/lib/icinga2
mv /tmp/ii/opt/tribblix/icinga2/share/icinga2-ido-mysql /tmp/iim/opt/tribblix/icinga2/share
mv /tmp/ii/opt/tribblix/icinga2/lib/icinga2/libdb_ido_mysql.so /tmp/iim/opt/tribblix/icinga2/lib/icinga2
mv /tmp/ii/opt/tribblix/icinga2/etc/icinga2/features-available/ido-mysql.conf /tmp/iim/opt/tribblix/icinga2/etc/icinga2/features-available
mv /tmp/ii/opt/tribblix/icinga2/etc/icinga2/features-available/ido-pgsql.conf /tmp/iip/opt/tribblix/icinga2/etc/icinga2/features-available

${THOME}/build/create_pkg TRIBblix-icinga2 /tmp/ii
${THOME}/build/create_pkg TRIBblix-icinga2-mysql /tmp/iim
${THOME}/build/create_pkg TRIBblix-icinga2-pgsql /tmp/iip

rm -fr /tmp/ii /tmp/iip /tmp/iim
