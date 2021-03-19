# IC1_projekt
Requirments:
* Docker
* Docker-compose

HTTP server configuration (html files)
---------------
You have to chose which files to use before the server is ran (before you use docker-compose).

Docker (HTTP and FTP servers)
---------------
```
# docker-compose up -d
```
Docker-compose creates both an ftp and http servers.

FTP server manipulation
---------------
Unlike with HTTP server, you can manipukate with data in ./ftp-server as you wish without interruption
and the result will be seen in the server.

Sudo upgrade
---------------
```
$ chmod +x upgradesudo.sh
# ./upgradesudo.sh
``` 
The cript serves to upgrade sudo version. After installation Ubuntu 18.04.5 server, the version of the
sudo was `1.8.21p2`, but we wanted a version `1.8.27`, because this version has two possible bugs
`CVE-2019-14287` and `CVE-2021-3156`.
The script will install the necessary packages and the necessery version of the sudo to install it

Set new user
---------------

