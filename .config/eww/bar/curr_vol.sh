#!/bin/bash
while true; do
  echo $(amixer sget Master -M | grep % | awk '{gsub(/[\[\]\%]/, "", $5); print $5}' 2> /dev/null)
done
