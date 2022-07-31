docker run -d -p 9000:9000 --restart=always  --name portainer -v "//var/run/docker.sock:/var/run/docker.sock" portainer/portainer

docker exec -u root -it portainer /bin/bash
chmod 666 /var/run/docker.sock