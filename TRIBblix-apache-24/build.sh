#!/bin/sh
#
#
#
${THOME}/build/dobuild httpd-2.4.25 -P /opt/tribblix/apache2 -C "--enable-mods-shared=most --with-expat=builtin --enable-ssl --enable-proxy --enable-proxy-ajp"
${THOME}/build/genpkg TRIBblix-apache-24 httpd-2.4.25
