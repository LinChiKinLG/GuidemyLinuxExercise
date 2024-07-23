declare arg0="$(basename $0)";
declare arg1="$1";
declare RECYCLEBIN_PATH="${HOME}/recyclebin";
declare RESTORE_INFO="${HOME}/.restore.info";

function recycle(){
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
		local iNode=$(ls -i $1 | cut -d " " -f 1);
		local fullPath=$(readlink -f $1);
		local fileName=$(basename $fullPath);
		local restoreFileName="${fileName}_${iNode}";
		if [ $fullPath = "$(pwd)/${arg0}" ]; then
			echo "Forbidden to delete recycle";
			exit 1;
		fi
		touch "${RESTORE_INFO}";
		echo "${restoreFileName}:${fullPath}" >> $RESTORE_INFO;
		mv $1 "${RECYCLEBIN_PATH}/${restoreFileName}";
	fi
}

if [ -e $RECYCLEBIN_PATH ]; then
	recycle "$arg1";
else
	mkdir $RECYCLEBIN_PATH;
	echo "recyclebin is created for you now";
	recycle "$arg1";
fi

