#!/bin/zsh
#cd "$(dirname "$0")"

echo $1; #input argument
echo $2;

counter=0;
for i in $(ls $1) 
do
array[$counter]=$i
let counter++
done

echo ${array[@]} #echo whole array