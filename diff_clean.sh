#!/bin/bash

removeList=$(./ls_diff.sh $1 $2)
#append path
counter=0
for i in $removeList;
    do
    removeList[$counter]=$1$i
    let counter++
    done
#batch remove
echo "Going to remove: "${removeList[@]}
if [ ${#removeList[@]} -ge 0 ];then
    rm -ri ${removeList[@]} 
else
    echo "Nothing to remove"
fi