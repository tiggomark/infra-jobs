sudo apt update && sudo apt upgrade
sudo apt install curl
wget -O- https://apt.corretto.aws/corretto.key | sudo apt-key add -
sudo add-apt-repository 'deb https://apt.corretto.aws stable main'
sudo apt-get update; sudo apt-get install -y java-11-amazon-corretto-jdk
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo apt-get install git-all
git clone https://github.com/tiggomark/jenkins.git
sudo groupadd docker
sudo usermod -aG docker ${USER}
cd jenkins
chmod +x gradlew
./gradlew docker dockerRun
sleep 5
docker volume create --name dbVolume
docker container stop jenkins
sleep 3
docker container rm jenkins
sleep 2
docker network create cluster-network
sleep 1
docker run  --restart=always --network cluster-network -v "//var/run/docker.sock:/var/run/docker.sock" -p 8080:8080 --name jenkins jenkins:0.1.0-SNAPSHOT