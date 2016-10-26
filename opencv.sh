#!/bin/bash

# Opencv install steps 

# @FILESOURCE opencv.sh
# @AUTHOR Mehul Ahuja
# @VERSION 1.0.0

# __BEGIN_MAIN__

if ! [ $(id -u) = 0 ]; then
   echo "This installer must be run as root :/"
   exit 1
fi
mkdir setup
cd setup
cores=$(grep -c ^processor /proc/cpuinfo)
cores=$(($cores * 2))
Sourcesystem=$(uname -m)

echo "updating repos"
sudo apt-get update
echo "removing old ffmpeg and x264"
sudo apt-get remove ffmpeg x264 libx264-dev
echo "installing dependencies for ffmpeg and x264"
sudo apt-get install build-essential checkinstall git cmake libfaac-dev libjack-jackd2-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libsdl1.2-dev libtheora-dev libva-dev libvdpau-dev libvorbis-dev libx11-dev libxfixes-dev libxvidcore-dev texi2html yasm zlib1g-dev
echo "installing gstreamer and gtk"
sudo apt-get install libgstreamer0.10-0 libgstreamer0.10-dev gstreamer0.10-tools gstreamer0.10-plugins-base libgstreamer-plugins-base0.10-dev gstreamer0.10-plugins-good gstreamer0.10-plugins-ugly gstreamer0.10-plugins-bad gstreamer0.10-ffmpeg libgtk2.0-0 libgtk2.0-dev libjpeg8 libjpeg8-dev axel
echo "installing cmake"
sudo apt-get install cmake cmake-curses-gui

echo -n "Starting to download opencv from the git repository..."

git clone git://github.com/Itseez/opencv.git
cd opencv*
git checkout -b 2.4.10

echo -n "Do you want to build all examples ?"
read text
mkdir build
cd build
if [ "$text" = "y" ]; then
	cmake -DCMAKE_BUILD_TYPE=Release -D BUILD_EXAMPLES=ON ..
else
	cmake -DCMAKE_BUILD_TYPE=Release ..
fi
echo "compiling opencv"
make -j$cores
sudo make install	
cd ..
echo "OpenCv successfully installed."

# __END_MAIN__