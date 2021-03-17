# IC1_projekt
Popis

Docker http server
---------------

```
cd http-server   
sudo docker build -t apache-server .
sudo docker run -dit --name http-server -p 80:80 apache-server
``` 
Note: The dot in the second command belongs to the command!

Sudo downgrade
---------------
```
chmod -x downgradesudo.sh
./downgradesudo.sh
``` 
Můžeš tu ještě rozepsat.
