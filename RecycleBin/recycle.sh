declare arg0="$(basename $0)";
declare RECYCLEBIN="${HOME}/recyclebin";
declare RESTORE_INFO="${HOME}/.restore.info";

if [ ! -e $RECYCLEBIN ]; then
	mkdir $RECYCLEBIN;
        echo "recyclebin is created for you now";
fi
if [ -z $1 ]; then
	echo "No filename provided";
	exit 1;
fi
if [ -d $1 ]; then
	echo "Directory detected. Not a valid file.";
	exit 1;
fi
if [ ! -e $1 ]; then
	echo "File does not exist";
	exit 1;
else
	declare iNode=$(ls -i $1 | cut -d " " -f 1);
	declare fullPath=$(readlink -f $1);
	declare fileName=$(basename $fullPath);
	declare restoreFileName="${fileName}_${iNode}";
	if [ $fullPath = "$(pwd)/${arg0}" ]; then
		echo "Forbidden to delete recycle";
		exit 1;
	fi
	touch "${RESTORE_INFO}";
	echo "${restoreFileName}:${fullPath}" >> $RESTORE_INFO;
	mv $1 "${RECYCLEBIN}/${restoreFileName}";
fi
