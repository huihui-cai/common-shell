#!/bin/bash

TrashDir="/Users/liangxh/.Trash"

for((i=1; $i <= $#; i++));
do
	rmFile=$(eval echo \$$i)
	realFile=`sh ~/.Tool/readlink.sh $rmFile`
	if [[ $realFile == $TrashDir* ]]; then
		rm $realFile
	else
		mv $realFile $TrashDir
	fi
done

