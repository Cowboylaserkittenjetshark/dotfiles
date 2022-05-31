#!/usr/bin/env bash
gen_workspace_literal() {
  current_workspace=""
  wmctrl -d | awk '{ print $1 " " $2 " " $9 }' | grep -v NSP | while read -r id active name; do
    name="${name#*_}"
    if wmctrl -l | grep --regexp '.*\s\+'"$id"'\s\+.*' >/dev/null; then
      button_class="occupied"
      button_name=""
    else
      button_class="empty"
      button_name=""
    fi
    if [ "$active" == '*' ]; then
      active_class="active"
      button_name=""
    else
      active_class="inactive"
    fi
    echo -n "(button :class \"$button_class $active_class\"  :onclick \"wmctrl -s $id\" \"$button_name\")"
  done
}
xprop -spy -root | while read -r; do
  echo '(box :orientation "h" :class "workspaces" :space-evenly true :halign "center" :valign "center" :hexpand true '"$(gen_workspace_literal)"')'
  # gen_workspace_literal
done
