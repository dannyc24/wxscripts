#!/bin/bash
today=`date -u "+%Y%m%d"`;


baseurlrtma="http://motherlode.ucar.edu/native/grid/NCEP/RTMA/CONUS_2p5km/";

sedURL=${baseurlrtma//\//\\\/};

curl ${baseurlrtma} | grep "<a href=" | sed -e "s/<a href=\"//g" |sed -e "s/\"$//g" |sed -e "s/\".*//g" | sed "s/^/`echo $sedURL`/" | grep -v ".gbx9" | grep -v ".ncx2" | tail -n 2 |tee /tmp/GRID-RTMA-get.txt

echo "Grab RTMA"

wget -i /tmp/GRID-RTMA-get.txt
