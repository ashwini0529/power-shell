#Script to install Go on Ubuntu systems <= 15.10

wget https://storage.googleapis.com/golang/go1.6.2.linux-amd64.tar.gz

tar -C /usr/local -xzf go1.6.2.linux-amd64.tar.gz

cd ~
mkdir go

echo "export GOPATH=$HOME/go" >> .bashrc
echo "export GOROOT=/usr/local/go" >> .bashrc
echo "export PATH=$PATH:$GOROOT/bin:$GOPATH/bin" >> .bashrc