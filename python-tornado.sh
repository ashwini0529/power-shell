#Some libraries that should be installed to use Tornado framework.
#Don't put -y after any pip install packagename.
#It does not support -y . It takes -y as a parameter.

#Install PIP if not installed
echo '************Installing pip************'
sudo apt-get install python-pip -y

#Install Developer Python before installing motor or pymongo

sudo apt-get install python-dev

#install tornado
echo '************Installing Tornado************'
sudo pip install tornado 

#install pymongo
echo '************Installing PyMongo************'
sudo pip install pymongo 

#install motor
echo '************Installing Motor************'
sudo pip install motor
