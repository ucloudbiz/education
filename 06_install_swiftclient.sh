#!/bin/bash

yum install python-setuptools
easy_install pip
pip install --upgrade setuptools
pip install python-swiftclient
pip install certifi
yum install libffi libffi-devel gcc glibc python-devel openssl-devel
pip install pyopenssl ndg-httpsclient pyasn1
