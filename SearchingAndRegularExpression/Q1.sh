result=$(find ./home -type "f" -name "test.txt");
if [ -z $result ]; then
	echo "NULL";
else
	echo $result;
fi
