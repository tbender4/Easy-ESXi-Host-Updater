#!/bin/sh

echo "Current version: "
current="$(esxcli software profile get | sed '1!d' \
	| cut -d' ' -f2)"
echo "${current}"

echo "Latest version of ESXi: "
latest="$(esxcli software sources profile list \
	--depot=https://hostupdate.vmware.com/software/VUM/PRODUCTION/main/vmw-depot-index.xml \
	| sort -k4 \
	| tail -2 | head -1 \
	| sed \
	-e 's/VMware.*$//' )"
echo "${latest}"

if [ ${current}=${latest} ]
then
	echo "Up to date"
else
	read -p "Update host from ${current} to ${latest}? (y/N): " confirm
	case "$confirm" in
		"") exit 1;;
		[yY] | [yY][eE][Ss]) update=true;;
	esac
fi

if [ "$update" = true ]
then
	echo "Updating to ${latest}..."
	esxcli software profile update -d https://hostupdate.vmware.com/software/VUM/PRODUCTION/main/vmw-depot-index.xml -p ${latest}
fi

