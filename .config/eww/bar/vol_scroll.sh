#!/bin/bash
if [ "$2" == "up" ]; then
  pactl set-sink-volume "$1" +1%
else
  pactl set-sink-volume "$1" -1%
fi
eww update curr_vol="$(pactl get-sink-volume "$1" | awk '{print $5}')"
