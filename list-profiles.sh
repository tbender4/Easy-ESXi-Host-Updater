#!/bin/sh


echo "Available profiles:"
#command='esxcli software sources profile list --depot=https://hostupdate.vmware.com/software/VUM/PRODUCTION/main/vmw-depot-index.xml'
command='cat profiles.txt'

filter='/standard/!d' 

if [ $# > 1 ]
then
	echo "Usage: $0 filter"
	echo "-----------------"
	echo "Filters available: standard | security-only | no-tools | so+nt | all"
	exit 1
fi

case "$1" in
	standard)
		filter='/standard/!d';;
	security-only) filter='/s-standard/!d';;
	so+nt) filter='/s-no-tools/!d';;
	no-tools) filter="'/s-no-tools/d' -e '/no-tools/!d'";;
	all) filter="";;
	*) exit 1;;
esac

$command | sort -k4 | sed \
	$filter
#	-e 's/VMware.*$//'
