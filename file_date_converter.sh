#!/bin/bash

#Print file names
for file in *
do
  #Skip the script file
  if [[ $file == "file_date_converter.sh" ]]
  then
    continue
  fi
  
  #Get date up to minutes
  TIMESTAMP=`stat -c %y "$file"`
  DATE=${TIMESTAMP:0:10}
  TIME=${TIMESTAMP:11:5}
  
  #Check if file has already been changed
  DATE_LABEL=$DATE-${TIME//[:]/}
  if [[ ${file:0:15} != "$DATE_LABEL" ]]
  then
    echo "Updated:" $file
    NEW_NAME="$DATE_LABEL $file"
    mv "$file" "$NEW_NAME"
  fi
done

