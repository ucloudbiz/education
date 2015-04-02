#!/bin/bash

yum install -y readline hg
wget https://pypi.python.org/packages/2.7/P/Pygments/Pygments-1.6-py2.7.egg#md5=1e1e52b1e434502682aab08938163034 --no-check-certificate
wget https://bootstrap.pypa.io/ez_setup.py -O - --no-check-certificate | python
easy_install Pygments-1.6-py2.7.egg
easy_install prettytable
wget http://peak.telecommunity.com/dist/ez_setup.py
python ez_setup.py 
easy_install pip
pip install --upgrade setuptools
pip install --upgrade pip
pip install --upgrade prettytable
pip install --upgrade Pygments
pip install cloudmonkey
pip install --upgrade cloudmonkey

cloudmonkey_path=`find /usr/lib -name site-packages`
sed -i.bak '172s/^\(.\{0\}\)/\1#/' $cloudmonkey_path/cloudmonkey/requester.py
sed -i.bak '175s/^\(.\{0\}\)/\1#/' $cloudmonkey_path/cloudmonkey/requester.py
sed -i.bak '176s/^\(.\{0\}\)/\1#/' $cloudmonkey_path/cloudmonkey/requester.py

cloudmonkey quit
