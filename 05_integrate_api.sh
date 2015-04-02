#!/bin/bash

cloudmonkey set profile server 1>/dev/null

server=myeduvm_01
tempfile1=$HOME/tmpfile1
tempfile2=$HOME/tmpfile2

cloudmonkey deployVirtualMachine \
	serviceofferingid=c504e367-20d6-47c6-a82c-183b12d357f2 \
	templateid=dc61305d-3520-44a1-bccc-7d7bb531bdc9 \
	zoneid=eceb5d65-6571-4696-875f-5a17949f3317 \
	name=$server \
	displayname=$server 

vmid=$(grep "\"id\"" $tempfile1 | awk '{print $2}' | tr -d '"' | tr -d ',' | head -1)
pw=$(grep "\"password\"" $tempfile1 | awk '{print $2}' | tr -d '"' | tr -d ',' )
vmip=$(grep "\"ipaddress\"" $tempfile1 | awk '{print $2}' | tr -d '"' | tr -d ','| tr -d '{' )

cloudmonkey associateIpAddress zoneid=eceb5d65-6571-4696-875f-5a17949f3317 | tee $tempfile2

ipid=$(grep "\"id\"" $tempfile2 | awk '{print $2}' | tr -d '"' | tr -d ',')
ipaddress=$(grep "\"ipaddress\"" $tempfile2 | awk '{print $2}' | tr -d '"' | tr -d ','| tr -d '{')

cloudmonkey createPortForwardingRule \
	ipaddressid=$ipid \
	privateport=80 \
	protocol=TCP \
	publicport=80 \
	virtualmachineid=$vmid

cloudmonkey createPortForwardingRule \
	ipaddressid=$ipid \
 	privateport=22 \
 	protocol=TCP \
 	publicport=10008 \
 	virtualmachineid=$vmid

echo "ssh root@$ipaddress -p 10008 for ssh access from outside"
echo "ssh root@$vmip -p 22 for ssh access from inside"
