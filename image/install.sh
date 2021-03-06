#!/bin/bash

URL=$1
FILENAME=$(basename $URL)
FOLDER=/opt/ccu-historian
FOLDERDB=/database

echo "Downloading $FILENAME..."
echo "   ${URL}"

curl --progress-bar --connect-timeout 30 --junk-session-cookies --insecure --location --max-time 3600 --retry 3 --retry-delay 60 "${URL}" --output "${FILENAME}"

echo "Installing..."
mkdir $FOLDER
unzip $FILENAME -d $FOLDER
chmod +x start.sh
mv start.sh $FOLDER

mkdir $FOLDERDB
mkdir $FOLDERDB/config

echo "Cleanup ..."
rm -fv "${FILENAME}"

echo "Finished"
exit 0
