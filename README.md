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

Sudo downgrade
---------------
```
$ chmod +x downgradesudo.sh
# ./downgradesudo.sh
``` 
Můžeš tu ještě rozepsat.
