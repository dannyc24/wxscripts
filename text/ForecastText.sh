#!/bin/bash
today=`date -u "+%Y%m%d"`;

webdate=`date -u "+%d-%B-%Y %H"`;
echo "WebDate ${webdate}";
baseurlMETARRAWL="http://weather.noaa.gov/pub/data/raw/fx/";
baseurlWORAW="http://weather.noaa.gov/pub/data/raw/fo/";
baseurlWURAW="http://weather.noaa.gov/pub/data/raw/ft/";
baseurlACRAW="http://weather.noaa.gov/pub/data/raw/ac/";

sedURL=${baseurlMETARRAWL//\//\\\/};

#curl ${baseurlMETARRAWL}
curl ${baseurlMETARRAWL} | grep "<a href=" |grep "${webdate}" | sed -e "s/<img src=\"\/icons\/text.gif\" alt=\"\[TXT\]\"> //g" |sed -e "s/<a href=\"//g" |sed -e "s/\"$//g" |sed -e "s/\".*//g" | sed "s/^/`echo $sedURL`/"  |tee /tmp/AFD-NWS.txt


sedURL=${baseurlWORAW//\//\\\/};

curl ${baseurlWORAW} | grep "<a href=" | grep "${webdate}" |  sed -e "s/<img src=\"\/icons\/text.gif\" alt=\"\[TXT\]\"> //g" |sed -e "s/<a href=\"//g" |sed -e "s/\"$//g" |sed -e "s/\".*//g" | sed "s/^/`echo $sedURL`/"  |tee /tmp/AFM-NWS.txt

#convective Outlooks in this directory
sedURL=${baseurlWURAW//\//\\\/};
curl ${baseurlWURAW} | grep "<a href=" | grep "${webdate}" | sed -e "s/<img src=\"\/icons\/text.gif\" alt=\"\[TXT\]\"> //g" |sed -e "s/<a href=\"//g" |sed -e "s/\"$//g" |sed -e "s/\".*//g" | sed "s/^/`echo $sedURL`/"  |tee /tmp/TAF-NWS.txt

sedURL=${baseurlACRAW//\//\\\/};
curl ${baseurlACRAW} | grep "<a href="  | sed -e "s/<img src=\"\/icons\/text.gif\" alt=\"\[TXT\]\"> //g" |sed -e "s/<a href=\"//g" |sed -e "s/\"$//g" |sed -e "s/\".*//g" | sed "s/^/`echo $sedURL`/"  |tee /tmp/AC-NWS.txt




echo "Grab Upper Air OBS direct from NOAA FTP TWG"

cd /awips2/edex/data/manual


wget -i /tmp/AFD-NWS.txt
wget -i /tmp/AFM-NWS.txt
wget -i /tmp/TAF-NWS.txt
wget -i /tmp/AC-NWS.txt
