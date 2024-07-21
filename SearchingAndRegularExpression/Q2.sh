result=$(ls | grep "^a\w*z$");
if [ -z $result ]; then
	echo "NULL";
else
	echo $result;
fi;
