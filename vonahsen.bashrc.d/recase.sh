#!/bin/bash
# randomly recase letters in a string - sarcasm or spongebob_chicken case
# sourced from Joshua Kehn

recase() {
  LC_ALL=C awk -v seed="$RANDOM$$" '
    BEGIN { srand(seed) }
    {
      for (i = 1; i <= length($0); i++) {
        c = substr($0, i, 1)
        printf "%s", (rand() < 0.5 ? tolower(c) : toupper(c))
      }
      print ""
    }
  '
}

noinput() { echo "error: no input given" >&2; exit 1; }

if [ "$#" -gt 0 ]; then
  # args passed
  printf '%s\n' "$*" | recase
elif [ -t 0 ]; then
  noinput
elif IFS= read -r first || [ -n "$first" ]; then
  # something piped in to recase
  { printf '%s\n' "$first"; cat; } | recase
else
  noinput
fi
