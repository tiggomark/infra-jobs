sysctl -w vm.max_map_count=262144
docker exec -u root -it jenkins /bin/bash
chmod 666 /var/run/docker.sock