#!/bin/sh
#
${THOME}/build/unpack boto3-1.4.0
cd boto3-1.4.0
python setup.py build
rm -fr /tmp/sut
python setup.py install --root=/tmp/sut
${THOME}/build/create_pkg TRIBboto3-python-27 /tmp/sut
cd ..
rm -fr /tmp/sut
