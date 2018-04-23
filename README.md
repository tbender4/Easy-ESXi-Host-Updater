# Easy-ESXi-Host-Updater
Scripts to easily update an ESXi host from the shell.

## Purpose

This is a few scripts to ease the process of updating an ESXi host to the latest version through the shell. It will pull official profiles by utilizing VMWare ESXi's production depot and `esxcli`.

`update-host.sh` will compare the latest profile to the one currently installed. If a newer version is available, you will be prompted if you would like to update.

## Installation

Enable SSH from the WebGUI by going to Host > Actions > Services > Enable Secure Shell (SSH). Log into the shell:

For Windows users: Use desired `ssh` client such as **PuTTY** and enter in the address field:
```
root@IP_ADDRESS
```

Linux/macOS: Enter in terminal:
```
ssh root@IP_ADDRESS
```

Once logged in:
```
wget https://raw.githubusercontent.com/tbender4/Easy-ESXi-Host-Updater/master/update-host.sh
chmod +x update-host.sh
```

## Usage
Run script in the current working directory of the script:
```
./update-host.sh
```

Example output:
```
$ ./update-host.sh
Current version:
ESXi-6.7.0-8169922-standard
Latest version of ESXi:
ESXi-6.7.0-8169922-standard
Up to date
```

