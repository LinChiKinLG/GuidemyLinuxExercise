result=$(ls | grep "Hello");
if [ -z $result ]; then
	echo "NULL";
else
	echo $result;
fi
