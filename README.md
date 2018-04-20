# Easy-ESXi-Host-Updater
Scripts to easily update an ESXi host from the shell.

## Purpose

This is a couple of scripts that can update an ESXi host to the latest version by utilizing VMWare ESXi's production depot and `esxcli`.

It will compare the latest profile to the one currently installed. Soon it'll be updated to actually apply the update.

## Installation

Enable SSH from the WebGUI by going to Host > Actions > Services > Enable Secure Shell (SSH). Log into the shell:

Windows: 
Use desired `ssh` client such as **PuTTY** and enter in the address field:
```
root@IP_ADDRESS
```

Linux/macOS:
```
ssh root@IP_ADDRESS
```

Once logged in:
```
wget https://raw.githubusercontent.com/tbender4/Easy-ESXi-Host-Updater/master/compare-profiles.sh
chmod +x compare-profiles.sh
```

## Usage
Run script in the current working directory:
```
./compare-profiles.sh
```
