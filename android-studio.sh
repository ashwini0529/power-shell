#This script will install Android Studio in Ubuntu and derivatives like Linux Mint etc.

#Add the repository
echo '************Adding Android Repository************'
sudo add-apt-repository ppa:paolorotolo/android-studio

#Update

sudo apt-get update

#Install Android Studio
echo '************Installing Android Studio************'
sudo apt-get install android-studio

#Done!
