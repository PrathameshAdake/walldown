#!/bin/bash

#take link of the image from wallhaven like https://wallhaven.cc/w/vg6dqp

read -p "Paste the link > " link


#get 6 digit code
digi6=$(echo "$link" | cut -d/ -f5)
#echo "$digi6"


#get 2 digit
digi2=$(echo "${digi6:0:2}")
#echo "$digi2"


#Input the File name 
#jpg is more consistent than png so jpg is recommended
echo ""
read -p "Image extension > " extt
read -p "Image Name > " imagen

finalimg=$imagen.$extt
echo "Requested link: $link"
echo "Image name to be saved in current directory:  $finalimg"



#Get Image using curl and save it in current directory

curl https://w.wallhaven.cc/full/${digi2}/wallhaven-${digi6}.${extt} > ${finalimg}


#open the image as soon as it downloads
sxiv ${finalimg}
