#!/bin/bash
for dir in /sys/class/drm/card?-*
do 
  if grep enabled "$dir"/enabled >/dev/null; then
    echo keyword monitor "$(echo "$dir" | sed 's/\/sys\/class\/drm\/card0-//')","$(sed -n '1p' "$dir"/modes)"@60,0x0,1 | socat - UNIX-CONNECT:/tmp/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket.sock
  fi
done
