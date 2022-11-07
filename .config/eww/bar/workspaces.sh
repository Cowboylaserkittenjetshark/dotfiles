#!/bin/bash
help() {
  echo "Usage: $0 [OPTIONS] num_workspaces"
  echo "Options:"
  echo "    -h    Print help text"
}

generate_json() {
  for ((index=1; index <= WORKSPACES; index++)); do
    echo "{}"
  done
}

while getopts "hn:" option; do
  case $option in
    h)
      help
      exit 0
      ;;
    ?)
      help
      exit 2
      ;;
  esac
done
shift "$((OPTIND -1))"
if [ -z "$1" ]; then
  help
  exit 2
fi
WORKSPACES=$1
echo "$WORKSPACES"
# while read -r line; do
#   qewrqewrewqr
# done < <(socat - UNIX-CONNECT:/tmp/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock)

