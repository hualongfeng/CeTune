import os,sys
lib_path = os.path.abspath(os.path.join('..'))
sys.path.append(lib_path)

from conf import *
import IPy

all_conf_data = config.Config("../conf/all.conf")
public_network = all_conf_data.get("public_network")
cluster_network = all_conf_data.get("cluster_network")

import paramiko
from ifparser import Ifcfg
import re
path = "/performance-data/602-1-fiorbd-randread-1024k-qd64-102400-30-30-rbd/raw/ceph-client1/ceph-server2_sar.txt"

def getHostnameFromPath(path):
    (filepath,filename) = os.path.split(path);
    m = re.match(r"(?P<hostname>.*)_sar\.txt", filename)
    hostname = m.group('hostname')
    return hostname
    
def getIfdataFromHostname(hostname):
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh.connect(hostname, port=22, username='root', allow_agent=False)
    stdin, stdout, stderr = ssh.exec_command('ifconfig')
    res,err = stdout.read(),stderr.read()
    result = res if res else err
    #print(result)
    ifdata = Ifcfg(result)
    return ifdata
    
def getValidIfs(ifdata):
    ifs = []
    for iface in ifdata.interfaces:
        #print(iface)
        ifobj = ifdata.get_interface(iface)
        ip = ifobj.ip 
        if ip and (ip in IPy.IP(public_network) or ip in IPy.IP(cluster_network)):
            ifs.append(iface)
    return ifs 
    
#hostname = getHostnameFromPath(path)
#ifdata = getIfdataFromHostname(hostname)
#nic_array = getValidIfs(ifdata)
#print(path)
#print(nic_array)
