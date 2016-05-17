#Script to install Go on Ubuntu systems >= 16.04

sudo apt install golang-go

cd ~
mkdir go

echo "export GOPATH=$HOME/go" >> .bashrc
echo "export GOROOT=/usr/lib/go" >> .bashrc
echo "export PATH=$PATH:$GOROOT/bin:$GOPATH/bin" >> .bashrc