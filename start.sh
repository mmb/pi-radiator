#!/bin/sh

export DISPLAY=:0

ADDRS=$(tr -d '\n' < urls)

for LOCAL in $(ls local/*.html); do
  ADDRS="$ADDRS file://$PWD/$LOCAL"
done

echo $ADDRS

midori -a $ADDRS &

sleep 10
xdotool search --class midori key F11

watch -n 30 "xdotool search --class midori key ctrl+Tab ctrl+R"
