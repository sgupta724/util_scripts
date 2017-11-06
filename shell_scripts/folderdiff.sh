#!/bin/bash
set -e

folderdiff()

{

	folder1="$1"
	folder2="$2"
	output1="/tmp/listing_a1.txt"
	output2="/tmp/listing_b1.txt"
	
	if [ -d "$folder1" ] &&  [ -d "$folder2" ]
		 then
	
		echo " find on folder1 : $folder1"

		find $folder1 -ls | sed "s;$folder1;;g" | awk '{ print $3,$7,$8,$9,$10,$11 }' > $output1

		echo " find on folder2"

		find $folder2 -ls | sed "s;$folder2;;g" | awk '{ print $3,$7,$8,$9,$10,$11 }' > $output2

		echo " diff"

		diff $output1 $output2
	else 
 		echo " folder dosenot exist"
	fi
}


echo  "start diff"

folderdiff "$1"  "$2"


echo "end"
