AllTxt=$(find . -type f -name "*.txt" | grep "colour"); #get all txt name with colour
for i in ${AllTxt[@]} ; do
	newName=$(echo $i | sed "s/colour/color/g"); #create new Name
	mv $i $newName; #replace new name to file
done;
