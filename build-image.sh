#!/bin/bash

tag=1.2

echo ""

echo -e "\nbuild docker hadoop image\n"
sudo docker build -t kiwenlau/hadoop:$tag .

echo ""