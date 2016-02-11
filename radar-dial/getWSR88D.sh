#!/bin/bash 

echo "Radar Script grabs Level 3 products from motherlode.ucar.edu";

echo "ARG 1 Radar Site Arg 2 number of entries";

radarsite=$1;
productlength=$2;

today=`date -u "+%Y%m%d"`;
#today="20150822";


baseurlN0R="http://motherlode.ucar.edu/native/radar/level3/nexrad/N0R/${radarsite}/${today}/";
baseurlN0C="http://motherlode.ucar.edu/native/radar/level3/nexrad/N0C/${radarsite}/${today}/";
baseurlN0S="http://motherlode.ucar.edu/native/radar/level3/nexrad/N0S/${radarsite}/${today}/";
baseurlN0V="http://motherlode.ucar.edu/native/radar/level3/nexrad/N0V/${radarsite}/${today}/";
baseurlN0X="http://motherlode.ucar.edu/native/radar/level3/nexrad/N0X/${radarsite}/${today}/";
baseurlN0H="http://motherlode.ucar.edu/native/radar/level3/nexrad/N0H/${radarsite}/${today}/";
baseurlNET="http://motherlode.ucar.edu/native/radar/level3/nexrad/NET/${radarsite}/${today}/";
baseurlNST="http://motherlode.ucar.edu/native/radar/level3/nexrad/NST/${radarsite}/${today}/";
baseurlNVL="http://motherlode.ucar.edu/native/radar/level3/nexrad/NVL/${radarsite}/${today}/";
baseurlNVW="http://motherlode.ucar.edu/native/radar/level3/nexrad/NVW/${radarsite}/${today}/";
baseurlN0M="http://motherlode.ucar.edu/native/radar/level3/nexrad/N0M/${radarsite}/${today}/";
baseurlN0Q="http://motherlode.ucar.edu/native/radar/level3/nexrad/N0Q/${radarsite}/${today}/";
baseurlN0U="http://motherlode.ucar.edu/native/radar/level3/nexrad/N0U/${radarsite}/${today}/";






echo $baseurlN0R;
echo $baseurlN0C;
echo $baseurlN0S;
echo $baseurlN0V;
echo $baseurlN0X;
echo $baseurlN0H;
echo $baseurlNET;
echo $baseurlNST;
echo $baseurlNVL;
echo $baseurlNVW;
echo $baseurlN0M;
echo $baseurlN0Q;
echo $baseurlN0U;


sedURL=${baseurlN0R//\//\\\/};

echo $sedURL

echo "Base Reflectivity N0R"
curl ${baseurlN0R} | grep "<a href=" | sed -e "s/<a href=\"//g" |sed -e "s/\"$//g" |sed -e "s/\".*//g" | sed "s/^/`echo $sedURL`/" | tail -n ${productlength} |tee /tmp/${radarsite}-N0R-get.txt


echo "Digital Base Reflectivity N0Q"
sedURL=${baseurlN0Q//\//\\\/};

echo $sedURL


curl ${baseurlN0Q} | grep "<a href=" | sed -e "s/<a href=\"//g" |sed -e "s/\"$//g" |sed -e "s/\".*//g" | sed "s/^/`echo $sedURL`/" | tail -n ${productlength} |tee /tmp/${radarsite}-N0Q-get.txt

echo "Base Velocity N0V"
sedURL=${baseurlN0V//\//\\\/};





echo "Base Velocity N0V"
sedURL=${baseurlN0V//\//\\\/};

curl ${baseurlN0V} | grep "<a href=" | sed -e "s/<a href=\"//g" |sed -e "s/\"$//g" |sed -e "s/\".*//g" | sed "s/^/`echo $sedURL`/" | tail -n ${productlength} |tee /tmp/${radarsite}-N0V-get.txt

echo "Digital Base Velocity N0U"
sedURL=${baseurlN0U//\//\\\/};

curl ${baseurlN0U} | grep "<a href=" | sed -e "s/<a href=\"//g" |sed -e "s/\"$//g" |sed -e "s/\".*//g" | sed "s/^/`echo $sedURL`/" | tail -n ${productlength} |tee /tmp/${radarsite}-N0U-get.txt



echo "Base Storm Relative Motion"
sedURL=${baseurlN0S//\//\\\/};

curl ${baseurlN0S} | grep "<a href=" | sed -e "s/<a href=\"//g" |sed -e "s/\"$//g" |sed -e "s/\".*//g" | sed "s/^/`echo $sedURL`/" | tail -n ${productlength} |tee /tmp/${radarsite}-N0S-get.txt

echo "Base Hydrometeor Classification"
sedURL=${baseurlN0H//\//\\\/};

curl ${baseurlN0H} | grep "<a href=" | sed -e "s/<a href=\"//g" |sed -e "s/\"$//g" |sed -e "s/\".*//g" | sed "s/^/`echo $sedURL`/" | tail -n ${productlength} |tee /tmp/${radarsite}-N0H-get.txt

echo "Base Differential Reflectivity"
sedURL=${baseurlN0X//\//\\\/};

curl ${baseurlN0X} | grep "<a href=" | sed -e "s/<a href=\"//g" |sed -e "s/\"$//g" |sed -e "s/\".*//g" | sed "s/^/`echo $sedURL`/" | tail -n ${productlength} |tee /tmp/${radarsite}-N0X-get.txt

echo "Base Correlation Coefficient"
sedURL=${baseurlN0C//\//\\\/};

curl ${baseurlN0C} | grep "<a href=" | sed -e "s/<a href=\"//g" |sed -e "s/\"$//g" |sed -e "s/\".*//g" | sed "s/^/`echo $sedURL`/" | tail -n ${productlength} |tee /tmp/${radarsite}-N0C-get.txt

echo "Melting Layer"
sedURL=${baseurlN0M//\//\\\/};

curl ${baseurlN0M} | grep "<a href=" | sed -e "s/<a href=\"//g" |sed -e "s/\"$//g" |sed -e "s/\".*//g" | sed "s/^/`echo $sedURL`/" | tail -n ${productlength} |tee /tmp/${radarsite}-N0M-get.txt

echo "Echo Tops"
sedURL=${baseurlNET//\//\\\/};

curl ${baseurlNET} | grep "<a href=" | sed -e "s/<a href=\"//g" |sed -e "s/\"$//g" |sed -e "s/\".*//g" | sed "s/^/`echo $sedURL`/" | tail -n ${productlength} |tee /tmp/${radarsite}-NET-get.txt


echo "Storm Tracks"
sedURL=${baseurlNST//\//\\\/};

curl ${baseurlNST} | grep "<a href=" | sed -e "s/<a href=\"//g" |sed -e "s/\"$//g" |sed -e "s/\".*//g" | sed "s/^/`echo $sedURL`/" | tail -n ${productlength} |tee /tmp/${radarsite}-NST-get.txt


echo "Vertical Integrated Liquid"
sedURL=${baseurlNVL//\//\\\/};

curl ${baseurlNVL} | grep "<a href=" | sed -e "s/<a href=\"//g" |sed -e "s/\"$//g" |sed -e "s/\".*//g" | sed "s/^/`echo $sedURL`/" | tail -n ${productlength} |tee /tmp/${radarsite}-NVL-get.txt


echo "Vertical Wind Profile"
sedURL=${baseurlNVW//\//\\\/};

curl ${baseurlNVW} | grep "<a href=" | sed -e "s/<a href=\"//g" |sed -e "s/\"$//g" |sed -e "s/\".*//g" | sed "s/^/`echo $sedURL`/" | tail -n ${productlength} |tee /tmp/${radarsite}-NVW-get.txt





echo "Going to grab products that have been compiled"
cd /awips2/edex/data/manual
wget -i /tmp/${radarsite}-N0R-get.txt
wget -i /tmp/${radarsite}-N0V-get.txt
wget -i /tmp/${radarsite}-N0S-get.txt
wget -i /tmp/${radarsite}-N0H-get.txt
wget -i /tmp/${radarsite}-N0X-get.txt
wget -i /tmp/${radarsite}-N0C-get.txt
wget -i /tmp/${radarsite}-N0M-get.txt
wget -i /tmp/${radarsite}-N0Q-get.txt
wget -i /tmp/${radarsite}-N0U-get.txt

wget -i /tmp/${radarsite}-NET-get.txt
wget -i /tmp/${radarsite}-NST-get.txt
wget -i /tmp/${radarsite}-NVL-get.txt
wget -i /tmp/${radarsite}-NVW-get.txt

