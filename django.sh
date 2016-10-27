# Some libraries that should be installed to use Django framework.

#Install PIP if not installed
echo '************ Installing pip ************'
sudo apt-get install python-pip

echo '************ Updating pip to latest version ************'
sudo pip install --upgrade pip


echo '************ Installing Python Setup Tool ************'
sudo pip install -U pip setuptools


#Install Developer Python before installing motor or pymongo

sudo apt-get install python-dev

#install tornado
echo '************Installing stable django ************'
sudo pip install django
