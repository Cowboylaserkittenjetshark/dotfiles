#!/bin/bash
while read -r line; do
  if [[ ${line:0:9} == "workspace" ]]; then
    jq --null-input --compact-output\
      --argjson MONITORS "$(hyprctl -j monitors)"\
      --argjson WORKSPACES "$(hyprctl -j workspaces | jq 'sort_by(.id)')"\
      '{"monitors": $MONITORS, "workspaces": $WORKSPACES}'
  fi
done < <(socat -U - UNIX-CONNECT:/tmp/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock)
