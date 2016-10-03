#!/bin/bash

if [ -n convert ]
then
  echo "ImageMagick detected. Here we go..."
else
  echo "Please install the ImageMagick CLI and try again."
  echo "http://www.imagemagick.org/"
  exit 1
fi

if [ "$1" != "" ] # check if arg 1 is present
then
  FILE=$1
else
  echo "Please provide a file as an argument."
  exit 1
fi

if [ ! -d "resized" ]
then
  mkdir resized
fi

echo "Resizing $FILE..."

convert $FILE +repage -resize '54x40' -gravity center -background none -extent 54x40 resized/Icon-App-27x20@2x.png #Messages
convert $FILE +repage -resize '81x60' -gravity center -background none -extent 81x60 resized/Icon-App-27x20@3x.png #Messages
convert $FILE +repage -resize '64x48' -gravity center -background none -extent 64x48 resized/Icon-App-32x24@2x.png #Messages
convert $FILE +repage -resize '96x72' -gravity center -background none -extent 96x72 resized/Icon-App-32x24@3x.png #Messages
convert $FILE +repage -resize '120x90' -gravity center -background none -extent 120x90 resized/Icon-App-60x45@2x.png #iPhone
convert $FILE +repage -resize '180x135' -gravity center -background none -extent 180x135 resized/Icon-App-60x45@3x.png #iPhone
convert $FILE +repage -resize '134x100' -gravity center -background none -extent 134x100 resized/Icon-App-67x50@2x.png #iPad
convert $FILE +repage -resize '148x110' -gravity center -background none -extent 148x110 resized/Icon-App-74x55@2x.png #iPad Pro
convert $FILE +repage -resize '1024x768' -gravity center -background none -extent 1024x768 resized/Icon-App-1024x768.png #Messages App Store

exit 0
