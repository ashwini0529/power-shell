#!/bin/bash
#This script is for installing node modules
#Usage direction:
#Use npm.sh <no-args> to install from package.json
#Use npm.sh <package-name> to install the package

#Arguments
PACKAGE_NAME=$1

#Check if npm is installed
NPM_OUTPUT="$(dpkg -l | grep npm)"
NPM_OUTPUT_SIZE=${#NPM_OUTPUT}

if [ $NPM_OUTPUT_SIZE==0 ]; then
	#npm is not installed
	#install npm
	sudo apt-get install npm
	#recall the script
	./npm.sh $PACKAGE_NAME
else
	#npm is already installed
	npm install $PACKAGE_NAME
fi