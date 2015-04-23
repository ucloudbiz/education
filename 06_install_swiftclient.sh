#!/bin/bash

yum install -y python-setuptools
easy_install pip
pip install --upgrade setuptools
pip install python-swiftclient
pip install certifi
yum install -y libffi libffi-devel gcc glibc python-devel openssl-devel
pip install pyopenssl ndg-httpsclient pyasn1
