#!/bin/bash

# prev: 1.8.21p2
# >>> new: 1.8.27 -> rok vydania 2019 
#		CVE-2021-3156
#		CVE-2019-14287
#
# nutnost nainstalovat 
#	gcc 'sudo apt-get install gcc'
#	make 'sudo apt-get install make'

#### bla bla ###

reboot() {
	echo "Aby sa zmeny ukazali, je nutny REBOOT!"
	echo -n ">> Restart? (y/n) "
	read x
	[[ "$x" = "y" ]] && sudo /sbin/reboot;
}


#### install packages ####

sudo apt-get --assume-yes install gc 
sudo apt-get --assume-yes install make

#### download, install sudo ####

cd /tmp/
wget "https://www.sudo.ws/dist/sudo-1.8.27.tar.gz"
tar xzvf sudo-1.8.27.tar.gz
cd sudo-1.8.27
rm -r sudo-1.8.27.tar.gz
./configure
make && sudo make install
bash -c "sudo --version"

reboot
