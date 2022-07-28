#!/bin/bash
eww kill
  while pgrep -u $UID -x eww >/dev/null; do sleep 1; done
  eww open bar
  if [ -d /sys/class/power_supply/BAT*/ ]; then
    eww update is_laptop=true
  fi
/home/ashton/.config/eww/bar/workspaces.sh
