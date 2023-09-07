#!/bin/zsh

while read -r input; do
  if [[ "$input" == *osascript* ]]; then
    echo "evil"
  else
    echo "$input"
  fi
done