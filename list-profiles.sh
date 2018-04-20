#!/bin/sh


echo "Available profiles:"
command='esxcli software sources profile list --depot=https://hostupdate.vmware.com/software/VUM/PRODUCTION/main/vmw-depot-index.xml'


$command | sort -k4 | sed \
	-e '/standard/!d' \
	-e 's/VMware.*$//'
