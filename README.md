# IC1_projekt
Requirments:
* Docker
* Docker-compose

Install packages
---------------
```
$ chmod +x installPackages.sh
# ./installPackages.sh
```
The script contains the necessary packages for the functionality of the OS.

HTTP server configuration (html files)
---------------
You have to chose which files to use before the server is ran (before you use docker-compose).

Docker (HTTP server)
---------------
```
# docker-compose up -d
```
Docker-compose creates both an ftp and http servers.

FTP server installation
---------------
```
$ chmod +x ftp-server/setupFTP
# ftp-server/setupFTP
```
The main FTP directory is in /home and ownership of the folder is "none", therefore Anonymous user has access to all user data.

SMB server installation
---------------
```
$ chmod +x smb-server/setupSMB
# smb-server/setupSMB
```
The commands above only install the server and shared folders. You still have to add users using the commands below.
```
# smbpasswd -a <username>
```

Sudo upgrade
---------------
```
$ chmod +x upgradesudo.sh
# ./upgradesudo.sh
``` 
The script serves to upgrade sudo version. After installation Ubuntu 18.04.5 server, the version of the
sudo was `1.8.21p2`, but we wanted a version `1.8.27`, because this version has two possible bugs
`CVE-2019-14287` and `CVE-2021-3156`.
The script will install the necessary packages and the necessery version of the sudo to install it

Set up new user
---------------
### Create new user
- `sudo adduser <username>`... user friendly setting
- OR,
- `sudo useradd -m <username>`... create a new user <username>, `-m` create home directory `/home/<username>/`
- `sudo passwd <username>`... sets a password for the user `<username>`, 

### Generating SSH keys
`ssh-keygen`
- `cat ~/.ssh/id_rsa.pub > ~/.ssh/authorized_keys` ... public key to text file name `authorized_keys`
- `sudo mv ~/.ssh/id_rsa /var/ftp/.ssh/id_rsa`
  - will probably need to be create directions `/var/ftp/.ssh`
  - `sudo mkdir /var/ftp` `sudo mkdir /var/ftp/.ssh`

### CVE-2019-14287
`sudo bash -c 'echo "xpepik ALL=(ALL, !root) /bin/cat, /usr/bin/whoami" > /etc/sudoers.d/xpepik'`

### flags.txt
`sudo bash -c 'echo "Zabi bobra zachranis strom" > /home/xpepik/flags.txt'`
`sudo chmod 600 /home/xpepik/flags.txt`

