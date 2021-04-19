#!/bin/bash

#arg is number of min. Default is 30. 
if [ $# -eq 0 ]
  then
    DURATION=30
  else
    DURATION=$1
fi

DURATION=$((DURATION*60))

#location of sound
SOUND=./bell_sound.aif

#start timer
seconds=$DURATION; date1=$((`date +%s` + $seconds)); 

#play sound at start
echo -n "Begin $(($DURATION/60)) minutes ";
mplayer -really-quiet $SOUND 

#counter prints minutes left countdown
while [ "$date1" -ge `date +%s` ]; do
    a=$date1
    b=`date +%s`
    count=$(((a - b)/60))
    echo -n "$count ";
    sleep 60
done

#play sound at end 
mplayer -really-quiet $SOUND 
echo "Done.";