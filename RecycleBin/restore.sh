declare arg0="$(basename $0)";
declare RECYCLEBIN="${HOME}/recyclebin";
declare RESTORE_INFO="${HOME}/.restore.info";

function restore(){
	if [ -f $2 ]; then
		echo -n "Do you want to overwrite? (Y/N)";
		read input;
		if [[ ! "$input" =~ ^[y|Y].*  ]]; then
			echo "Cancelled...";
			exit 0;
		fi
	fi
	mv "${RECYCLEBIN}/$1" "$2";
	sed -i "/^$1/d" $RESTORE_INFO;
}
if [ ! -f $RESTORE_INFO ]; then
	touch $RESTORE_INFO;
	echo ".restore.info is created for you now";
fi
if [ ! -e $RECYCLEBIN ]; then
        mkdir $RECYCLEBIN;
        echo "recyclebin is created for you now";
fi
if [ -z $1 ]; then
        echo "No filename provided";
        exit 1;
fi
for i in $(cat $RESTORE_INFO); do
	declare file=$(echo $i | cut -d ":" -f 1);
	declare originalFile=$(echo $i | cut -d ":" -f 2);
	if [ $file = $1 ]; then
		restore $file $originalFile;
		exit 1;
	fi
done
echo "File does not exist";
exit 1;
