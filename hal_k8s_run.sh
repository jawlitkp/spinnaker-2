set -e
export TERMINFO=/usr/lib/terminfo
export TERM=xterm

mkdir /supporting_data
echo $BUILD_KEY >> /supporting_data/build.json
echo $DOCKER_KEY >> /supporting_data/docker.json

curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x kubectl
mv kubectl /usr/local/bin/kubectl

echo "Downloading Halyard..."
curl -O https://raw.githubusercontent.com/spinnaker/halyard/master/install/stable/InstallHalyard.sh

echo "Installing Halyard..."
sudo bash InstallHalyard.sh -y --user ubuntu
