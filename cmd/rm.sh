#!/bin/bash

TrashDir="/Users/liangxh/.Trash"

for((i=1; $i <= $#; i++));
do
	rmFile=$(eval echo \$$i)
	if [[ $rmFile == "-"* ]]; then
		continue
	fi
	realFile=`sh ~/.Tool/readlink.sh $rmFile`
	if [[ $realFile == $TrashDir* ]]; then
		rm -rf $realFile
	else
		trashFileName=$TrashDir/`basename $realFile`
		if [ -e $trashFileName ]; then
			fileWithSuffix=$trashFileName"."`date +%s`
			if [ -e $fileWithSuffix ]; then
				rm -rf $fileWithSuffix
			fi
			mv $trashFileName $fileWithSuffix
		fi
		mv $realFile $TrashDir
	fi
done

