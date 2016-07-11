#!/bin/sh
#
# Add the CA bundle
# (has an extra symlink for wget compatibility)
# http://stackoverflow.com/questions/3777075/ssl-certificate-rejected-trying-to-access-github-over-https-behind-firewall
#
mkdir ca-bundle
cd ca-bundle
wget http://curl.haxx.se/ca/cacert.pem
cat cacert.pem | gawk 'split_after==1{n++;split_after=0} /-----END CERTIFICATE-----/ {split_after=1} {print > "cert" n ".pem"}'
mkdir -p /tmp/cab/etc/openssl/certs
cp cacert.pem /tmp/cab/etc/openssl
foreach file ( cert*.pem )
cp $file /tmp/cab/etc/openssl/certs/`openssl x509 -noout -hash -in $file`.0
end
cd /tmp/cab/etc
ln -s openssl ssl
${THOME}/build/create_pkg TRIBca-bundle /tmp/cab
cd
rm -fr /tmp/cab
