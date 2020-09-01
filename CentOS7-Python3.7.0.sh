#!/bin/bash

yum install -y wget gcc gcc-c++ openssl-devel bzip2-devel libffi-devel

wget https://www.python.org/ftp/python/3.7.0/Python-3.7.0.tgz
tar xzvf Python-3.7.0.tgz
cd Python-3.7.0
./configure --enable-optimizations
make -j4 altinstall

mv /usr/bin/python /usr/bin/python.bak
ln -s /usr/local/bin/python3.7 /usr/bin/python
ln -s /usr/local/bin/pip3.7 /usr/bin/pip

python -V
pip -V

sed -i 's/^#!\/usr\/bin\/python$/#!\/usr\/bin\/python2.7/g' /usr/bin/yum
sed -i 's/^#!\/usr\/bin\/python$/#!\/usr\/bin\/python2.7/g' /usr/libexec/urlgrabber-ext-down
