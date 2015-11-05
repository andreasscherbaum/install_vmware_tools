#/bin/bash
#
# written by Andreas 'ads' Scherbaum <ads@wars-nicht.de>
#
# Usage:
#
# * Start the script (as root)
# * Click the "Install VMware Tools option in the menu
# * Wait a few seconds

# break on any error
set -e

# unpack the archive here
cd /tmp

# wait for installation to start
if [ ! -d /media/VMware\ Tools ];
then
	echo "please start VMware Tools installation"
fi
while [ ! -d /media/VMware\ Tools ];
do
	sleep 2
done

# virtual drive mounted, unpack it here
echo ""
echo "unpacking VMware Tools into /tmp"
tar xf /media/VMware\ Tools/VMwareTools*.tar.gz

# install VMware tools in silent mode
cd vmware-tools-distrib
echo "starting installation"
./vmware-install.pl -d

# go back to previous directory (/tmp) and clean up
cd -
echo "cleaning up"
rm -rf /tmp/vmware-tools-distrib
echo "VMware Tools installed"
