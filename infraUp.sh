sudo apt update && sudo apt upgrade
sudo apt install curl
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo apt-get install git-all
git clone https://github.com/tiggomark/jenkins.git
cd jenkins
chmod +x gradlew
./gradlew docker dockerRun
sleep 5
docker container stop jenkins
sleep 3
docker container rm jenkins
sleep 2
docker network create cluster-network
sleep 1
docker run --rm --group-add 0 --network cluster-network -v "//var/run/docker.sock:/var/run/docker.sock" -p 8080:8080 --name jenkins jenkins:0.1.0-SNAPSHOT
docker exec -u root -it jenkins /bin/bash
chmod 666 /var/run/docker.sock