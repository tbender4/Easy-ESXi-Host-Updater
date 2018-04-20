#!/bin/sh


echo "Current version: "
esxcli software profile get | sed '1!d' \
	| cut -d' ' -f2

echo "Latest version of ESXi: "
esxcli software sources profile list \
	--depot=https://hostupdate.vmware.com/software/VUM/PRODUCTION/main/vmw-depot-index.xml /
	| sort -k4 \
	| tail -2 | head -1 \
	| sed \
	-e 's/VMware.*$//'
