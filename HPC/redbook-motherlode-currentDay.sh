#!/bin/bash
today=`date -u "+%Y%m%d"`;

webdate=`date -u "+%d-%b-%Y"`;
echo "WebDate ${webdate}";
baseurlMETARRAWL="http://motherlode.ucar.edu/native/redbook/";
#baseurlWORAW="http://weather.noaa.gov/pub/data/raw/fm/";
#baseurlWURAW="http://weather.noaa.gov/pub/data/raw/fo/";
#baseurlACRAW="http://weather.noaa.gov/pub/data/raw/ac/";

sedURL=${baseurlMETARRAWL//\//\\\/};

#curl ${baseurlMETARRAWL}
curl "${baseurlMETARRAWL}?C=M;O=D" | grep "<a href=" | grep "${webdate}" | sed -e "s/<img src=\"\/icons\/text.gif\" alt=\"\[TXT\]\"> //g" |sed -e "s/<a href=\"//g" |sed -e "s/\"$//g" |sed -e "s/\".*//g" | sed "s/^/`echo $sedURL`/"  |tee /tmp/REDBOOK-MOTHERLODE-DAY.txt


#sedURL=${baseurlWORAW//\//\\\/};

#curl ${baseurlWORAW} | grep "<a href=" | grep "${webdate}" |  sed -e "s/<img src=\"\/icons\/text.gif\" alt=\"\[TXT\]\"> //g" |sed -e "s/<a href=\"//g" |sed -e "s/\"$//g" |sed -e "s/\".*//g" | sed "s/^/`echo $sedURL`/"  |tee /tmp/AFM-NWS.txt

#convective Outlooks in this directory
#sedURL=${baseurlWURAW//\//\\\/};
#curl ${baseurlWURAW} | grep "<a href=" | grep "${webdate}" | sed -e "s/<img src=\"\/icons\/text.gif\" alt=\"\[TXT\]\"> //g" |sed -e "s/<a href=\"//g" |sed -e "s/\"$//g" |sed -e "s/\".*//g" | sed "s/^/`echo $sedURL`/"  |tee /tmp/TAF-NWS.txt

#sedURL=${baseurlACRAW//\//\\\/};
#curl ${baseurlACRAW} | grep "<a href="  | sed -e "s/<img src=\"\/icons\/text.gif\" alt=\"\[TXT\]\"> //g" |sed -e "s/<a href=\"//g" |sed -e "s/\"$//g" |sed -e "s/\".*//g" | sed "s/^/`echo $sedURL`/"  |tee /tmp/AC-NWS.txt



echo "Grab the Redbook products from UCAR UNIDATA motherlode server";

cd /awips2/edex/data/manual


wget -i /tmp/REDBOOK-MOTHERLODE.txt
#wget -i /tmp/AFM-NWS.txt
#wget -i /tmp/TAF-NWS.txt
#wget -i /tmp/AC-NWS.txt

echo "Finished ingest awaiting for EDEX ingest";
