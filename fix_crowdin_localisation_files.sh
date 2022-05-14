#!/bin/bash

MOD_LOCATION=$1

echo "Fixing $MOD_LOCATION/localisation"

ls $MOD_LOCATION/localisation | grep -v 'english\|replace' | while read language; do
  echo "  Fixing $language localisation files"
  for file in $MOD_LOCATION/localisation/$language/*l_$language.yml; do
    echo "    Fixing $file"
    sed '/^l_english:/d' -i "$file"
    sed "s/^---/\xEF\xBB\xBFl_$language:/" -i "$file"
  done
  echo "  DONE Fixing $language localisation files"
done

echo "DONE Fixing $MOD_LOCATION/localisation"
echo "Fixing $MOD_LOCATION/localisation/replace"

ls $MOD_LOCATION/localisation/replace | grep -v 'english' | while read language; do
  echo "  Fixing $language localisation/replace files"
  for file in $MOD_LOCATION/localisation/replace/$language/*l_$language.yml; do
    echo "    Fixing $file"
    sed '/^l_english:/d' -i "$file"
    sed "s/^---/\xEF\xBB\xBFl_$language:/" -i "$file"
  done
  echo "  DONE Fixing $language localisation/replace files"
done

echo "DONE Fixing $MOD_LOCATION/localisation/replace"