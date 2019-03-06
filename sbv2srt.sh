#!/bin/bash
# (C) 2019 Keir Finlow-Bates
# See LICENSE for the licensing details of this software

# usage: ./sbv2srt.sh file.sbv
# returns file.srt in srt format

if [ -z $BASH_VERSION ] ; then
	echo -e "You must run this script using bash." 1>&2
	exit 1
fi

NAME=$(echo "$1" | cut -f 1 -d '.').srt
echo -e "$NAME"
COUNT=1
echo -e "$COUNT" > $NAME
FIRST=1

while read LINE
do
  if [ "$FIRST" -eq "1" ] ; then
    LINE="${LINE/#0:/00:}"
    LINE="${LINE/,/ --> }"
    LINE="${LINE//\./,}"
    LINE="${LINE//> 0:/> 00:}"
    echo -e "$LINE" >> $NAME     
    FIRST=0
  else
    if [ -z "$LINE" ] ; then
        COUNT=$((COUNT+1))
        echo -e "$LINE" >> $NAME
        echo -e "$COUNT" >> $NAME
        read LINE
        LINE="${LINE/#0:/00:}"
        LINE="${LINE/,/ --> }"
        LINE="${LINE//\./,}"
        LINE="${LINE//> 0:/> 00:}"
        echo -e "$LINE" >> $NAME
    else
        echo -e "$LINE" >> $NAME
    fi
  fi
done < $1
