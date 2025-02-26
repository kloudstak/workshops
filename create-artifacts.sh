#!/bin/bash

get_script_path(){
  SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
  echo "SCRIPT_DIR: ${SCRIPT_DIR}"
}

get_script_path

for dir in ${SCRIPT_DIR}/*/
do
    dir_name=$(basename "$dir")
    
    # Skip directories containing "00"
    if [[ "$dir_name" == *00* ]]; then
        continue
    fi

    for filename in $dir/*.md
    do
        if [ -f "$filename" ]; then
            echo "Processing Markdown file: $filename"
            claat export "$filename"
        fi
    done
done

for dir in ${SCRIPT_DIR}/*/
do
    if [ -f "$dir/index.html" ]; then
        echo "Directory containing index.html: $dir"
    fi
done