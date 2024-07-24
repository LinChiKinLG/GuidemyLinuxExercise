#!/bin/bash

function main(){
	local directory="$1";
	if [ ! -d $directory ]; then
		usage;
		exit 1;
	fi
	if [ -z $(find "$directory" -type "f" -name "*.txt") ]; then
		echo ".txt not found";
		exit 1;
	fi
	analyze_text_files $directory;
	exit 0;
}
function usage(){
	echo "Usage: analyze.sh directory";
}
function analyze_text_files(){
	local directory=$1;
	local TOTAL_LINES=0;
	local TOTAL_WORDS=0;
	printf "%-20s%-10s%-10s\n" "Path" "Lines" "Words";
	for i in $(find "$directory" -type "f" -name "*.txt") ;do
		local lines=$(cat "$i" | wc -l);
		local words=$(cat "$i" | wc -w);
		TOTAL_LINES=$(expr $TOTAL_LINES + $lines);
		TOTAL_WORDS=$(expr $TOTAL_WORDS + $words);
		printf "%-20s%-10s%-10s\n" $i $lines $words;
	done
	printf "%-20s%-10s%-10s\n" "Total" $TOTAL_LINES $TOTAL_WORDS;
}
main $1;
