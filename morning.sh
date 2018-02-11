#!/bin/bash
#
# Usage: morning.sh [time]
#
# Options:
#   time - The time format must be 00:00 or 0:00
#          If no options or the option format is wrong,
#          it will be stop after 1 hour.


# default: stop after 1 hour
STOP_AT=$(date -j -v "+1H" "+%H:%M")
if [ ! -z $1 ] && [[ $1 =~ ^[0-9]{1,2}:[0-9]{2}$ ]] ; then
  STOP_AT="${1}"
  if [ ${#1} -eq 4 ] ; then
    STOP_AT="0${1}"
  fi
fi

BASE_DIR=`python -c 'import os,sys;print(os.path.dirname(os.path.realpath(sys.argv[1])))' "${0}"`

function start {
  # start vlc
  open -g -a "VLC" --background "${BASE_DIR}/playlist.xspf"
  # count every 10 min this script stops until STOP_AT time
  alert_10_minutes.sh ${STOP_AT}
}

function stop {
  # stop vlc
  osascript -e 'quit app "VLC"'

  # stop terminal after finishing this script
  sleep 3 && osascript -e 'quit app "Terminal"' &
}

start

stop
