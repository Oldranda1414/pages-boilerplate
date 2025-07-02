#!/usr/bin/env bash

# Get the directory where the script is located
TEMP=$(realpath "$0") 
SCRIPT_PATH=$(dirname "$TEMP")

ASSETS_FOLDER="$SCRIPT_PATH/../assets"
SRC_FOLDER="$ASSETS_FOLDER/src"
OUT_FOLDER="$ASSETS_FOLDER/mermaid"

if [[ ! -d "$ASSETS_FOLDER" ]]; then
  echo "❌ assets folder not found"
  echo "Error: '$ASSETS_FOLDER' is not a valid directory."
  exit 1
fi

if [[ ! -d "$SRC_FOLDER" ]]; then
  echo "❌ source folder not found"
  echo "Error: '$SRC_FOLDER' is not a valid directory."
  exit 1
fi

if [[ ! -d "$OUT_FOLDER" ]]; then
  echo "❌ out folder not found"
  echo "Error: '$OUT_FOLDER' is not a valid directory."
  exit 1
fi

for FILE in "$SRC_FOLDER"/*.mmd; do
  if [[ -f "$FILE" ]]; then
    BASENAME=$(basename "$FILE" .mmd)
    mmdc -i "$FILE" -o "$OUT_FOLDER"/"$BASENAME".png -t dark -b '#0d1117' -q
  fi
done
