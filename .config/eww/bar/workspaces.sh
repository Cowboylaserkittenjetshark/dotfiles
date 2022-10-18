#!/bin/bash
gen_workspace_literal () {
  # CURRENT_WORKSPACE="$(hyprctl activewindow | grep workspace | awk '{print $2}')"
  for id in {1..5}; do
    if hyprctl workspaces | grep -A1 "workspace ID $id" | grep -v -e "0" -e "^$" -e "workspace ID" >/dev/null; then
      button_class="occupied"
      button_name=""
    else
      button_class="empty"
      button_name=""
    fi
    if [ "$CURRENT_WORKSPACE" = "$id" ]; then
      active_class="active"
      button_name=""
    else
      active_class="inactive"
    fi
    echo -n "(button :class \"$button_class $active_class\" :onclick \"hyprctl dispatch workspace $id\" \"$button_name\")"
  done
}
while read -r line; do
  if grep ^workspace <<< "$line" >/dev/null; then
    CURRENT_WORKSPACE="$(awk -F '>' '{print $3}' <<< "$line")"
  fi
  eww update $1='(box :orientation "h" :class "workspaces" :space-evenly true :halign "center" :valign "center" :hexpand true '"$(gen_workspace_literal "$line")"')'
  # echo '(box :orientation "h" :class "workspaces" :space-evenly true :halign "center" :valign "center" :hexpand true '"$(gen_workspace_literal "$line")"')'
done < <(socat - UNIX-CONNECT:/tmp/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock)
