#!/bin/bash
today=`date -u "+%Y%m%d"`;


baseurlgfs80="http://motherlode.ucar.edu/native/grid/NCEP/GFS/CONUS_80km/";

sedURL=${baseurlgfs80//\//\\\/};

curl ${baseurlgfs80} | grep "<a href=" | sed -e "s/<a href=\"//g" |sed -e "s/\"$//g" |sed -e "s/\".*//g" | sed "s/^/`echo $sedURL`/" | grep -v ".gbx9" | grep -v ".ncx2" | tail -n 2 |tee /tmp/GRID-GFS80-get.txt

echo "Grab GFS 80"

cd /awips2/edex/data/manual


wget -i /tmp/GRID-GFS80-get.txt
