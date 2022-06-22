#!/bin/bash
if [ $2 == "up" ]; then
  amixer -M sset $1 1%+
else
  amixer -M sset $1 1%-
fi
