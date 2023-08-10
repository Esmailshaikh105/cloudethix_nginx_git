#!/bin/bash
########################################################################################################
#   Script Name : 09_MONITOR_WEBSITE.sh                                                                # 
#   Version     : V 2.2                                                                                #
#   Date        : 07/08/2023                                                                           #
#   Purpose     : Write a shell script that fetches data from an AWS EC2 APIand processes the JSON     #
#                response to print instance IDs and its public and private IP address.                 #
########################################################################################################

DIR=$1
OUT_FILE="/tmp/out1.txt"

if [[ $# -eq 1 ]]; then
    echo -e  "I M RUNNING SCRIPT"  
  ls -1 "$DIR" | awk -F'.' '{print $2}' | sort | uniq > "$OUT_FILE"

  while read -r c1; do
      case $c1 in 
      csv) 
        echo -e "csv file moving in $DIR/csv"
        mkdir -p "$DIR/CSV01"
        mv "$DIR"/*.csv "$DIR/CSV01"
        ;;
     doc) 
        echo -e "dpc file moving in $DIR/doc"
        mkdir -p "$DIR/DOC01"
        mv "$DIR"/*.doc "$DIR/DOC01"
        ;;
     jpg) 
        echo -e "jpg file moving in $DIR/jpg"
        mkdir -p "$DIR/JPG01"
        mv "$DIR"/*.jpg "$DIR/JPG01"
        ;;
     txt) 
        echo -e "text file moving in $DIR/txt"
        mkdir -p "$DIR/TXT01"
        mv "$DIR"/*.txt "$DIR/TXT01"
        ;;
    *) 
        echo -e "moving all  file except .$c1 moving in $DIR/other"
        mkdir -p "$DIR/OTHER01"
        mv "$DIR"/*."$c1" "$DIR/OTHER01"
        ;;
esac
done < "$OUT_FILE"

# Cleaning the temporary output file
rm "$OUT_FILE"

else
echo -e "This script requires exactly one argument:"
echo -e  "Usage: $0 DIR"
exit 1
fi
