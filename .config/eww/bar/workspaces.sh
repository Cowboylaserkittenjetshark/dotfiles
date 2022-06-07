#!/bin/sh
gen_workspace_literal () {
  if [ $(echo $1 | awk -F '>' '{print $1}') == "workspace" ]; then
    current_workspace="$(echo $1 | awk -F '>' '{print $3}')"
  fi
  for id in {1..5}; do
    if hyprctl workspaces | grep "workspace ID $id" >/dev/null; then
      button_class="occupied"
      button_name=""
    else
      button_class="empty"
      button_name=""
    fi
    if [[ $current_workspace == $id ]]; then
      active_class="active"
      button_name=""
    else
      active_class="inactive"
    fi
    echo -n "(button :class \"$button_class $active_class\" \"$button_name\")"
  done
}
  current_workspace=""
socat - UNIX-CONNECT:/tmp/hypr/$(echo $HYPRLAND_INSTANCE_SIGNATURE)/.socket2.sock |  while read -r line; do
#eww update wm_workspaces="$(echo '(box :orientation "h" :class "workspaces" :space-evenly true :halign "center" :valign "center" :hexpand true '"$(gen_workspace_literal $line)"')')"
echo '(box :orientation "h" :class "workspaces" :space-evenly true :halign "center" :valign "center" :hexpand true '"$(gen_workspace_literal $line)"')'
done
