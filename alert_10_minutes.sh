#!/bin/bash
STOP_AT=$(date -j -v "+1H" "+%H:%M")
if [ ! -z $1 ] && [[ $1 =~ ^[0-9]{1,2}:[0-9]{2}$ ]] ; then
  STOP_AT="${1}"
  if [ ${#1} -eq 4 ] ; then
    STOP_AT="0${1}"
  fi
fi
echo "Will stop at ${STOP_AT}"

while :
do
  MS=$(date "+%M%S")
  TIME=$(date "+%H:%M")
  if [ ${MS:1:3} -eq "000" ] ; then
    say -v Kyoko "${TIME} になりました"  # Japanese
  fi
  sleep 1
  if [ ${TIME} = ${STOP_AT} ] ; then
    say -v Kyoko "指定の時刻を過ぎたので終了します"  # Japanese
    exit
  fi
done
