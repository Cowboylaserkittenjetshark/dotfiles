#!/bin/bash
for FILE in *.gitignore; do
  echo "# File: $FILE" >> global.gitignore
  cat "$FILE" >> global.gitignore
done;
