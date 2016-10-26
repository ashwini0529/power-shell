#!/bin/bash

# Opencv install steps 

# @FILESOURCE opencv.sh
# @AUTHOR Mehul Ahuja
# @VERSION 1.0.0

# __BEGIN_MAIN__

sudo apt-get update
sudo apt-get install build-essential libgtk2.0-dev libjpeg62-dev libtiff4-dev libjasper-dev libopenexr-dev cmake python-dev python-numpy libtbb-dev libeigen2-dev yasm libfaac-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev
cd ~
echo "Creating a directory for installation"
mkdir ubuntu_installer
cd ubuntu_installer
echo "Downloading ffmpeg files"
wget http://ffmpeg.org/releases/ffmpeg-0.7-rc1.tar.gz
echo "Unpacking files...."
tar -xvzf ffmpeg-0.7-rc1.tar.gz
cd ffmpeg-0.7-rc1
echo "Configuring unpacked files..."
./configure --enable-gpl --enable-version3 --enable-nonfree --enable-postproc --enable-libfaac --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-libtheora --enable-libvorbis --enable-libxvid --enable-x11grab --enable-swscale --enable-shared
make
echo "Installing files and dependancies"
sudo make install
cd ../
wget -c http://garr.dl.sourceforge.net/project/opencvlibrary/opencv-unix/2.4.8/opencv-2.4.8.zip
unzip opencv-2.4.8.zip
cd opencv-2.4.8/
cmake -D WITH_TBB=ON -D BUILD_NEW_PYTHON_SUPPORT=ON -D WITH_V4L=OFF -D INSTALL_C_EXAMPLES=ON -D INSTALL_PYTHON_EXAMPLES=ON -D BUILD_EXAMPLES=ON .
make
echo "Installing openCV to your system, Please wait..."
sudo make install
echo "Installation done, configuring system"
sudo touch /etc/ld.so.conf.d/opencv.conf 
sudo sh -c 'echo "/usr/local/lib" >> /etc/ld.so.conf.d/opencv.conf'
echo "Reloading configuration files created."
sudo ldconfig
sudo sh -c 'echo "PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig" >>/etc/bash.bashrc'
sudo sh -c 'echo "export PKG_CONFIG_PATH" >>/etc/bash.bashrc'
sudo cp /usr/local/lib/python2.7/site-packages/cv.so /usr/local/lib/python2.7/dist-packages/cv.so
echo "Installation Done."

# __END_MAIN__