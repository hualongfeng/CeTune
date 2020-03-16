#!/bin/bash

pkg_list="python-pip unzip sysstat curl openjdk-7-jre haproxy pdsh zip expect python-matplotlib python-numpy python-yaml sqlite"

pip_pkg_list="pyyaml argparse markdown2 IPy paramiko ifparser xlsxwriter"

for pkg in ${pkg_list}
do
    apt install -y ${pkg}
done

for pip_pkg in ${pip_pkg_list}
do
    pip install ${pip_pkg}
done

# For Python 2.7
pip install web.py==0.40
# For Python 3
#python3 -m pip install web.py==0.40
