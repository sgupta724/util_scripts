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
		if [ "$?" -eq 0 ];
		then 
		
			echo " find on folder2 : $folder2"

			find $folder2 -ls | sed "s;$folder2;;g" | awk '{ print $3,$7,$8,$9,$10,$11 }' > $output2
			if [ "$?" -eq 0 ];
			then	
				echo " diff"
		
				diff $output1 $output2
			else
				echo " Something went wrong. Trying to find files in $folder2" 
			fi
		else 
			echo " Something went wrong. Trying to find files in $folder1"
		fi 
	else 
 		echo " Folder dosenot exist"
	fi
}

if [ $# -eq 2 ]
then 
echo  "Start Diff"
	folderdiff "$1"  "$2"
else 
	echo " Folder names missing. Syntax is : bash folderdiff.sh '{folder1 path}' '{folder2 path}' "

fi

echo "end"


