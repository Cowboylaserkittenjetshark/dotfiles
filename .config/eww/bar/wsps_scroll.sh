#! /bin/sh
if [ $1 == up ]; then
  wmctrl -s $(wmctrl -d | grep "*" | awk '{print $1 + 1}')
else
  wmctrl -s $(wmctrl -d | grep "*" | awk '{print $1 - 1}')
fi
