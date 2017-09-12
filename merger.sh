#!/bin/zsh
#cd "$(dirname "$0")"

echo $1; #input argument
echo $2;

#counter=0;
#for i in $(ls $1) 
#do
#array[$counter]=$i
#let counter++
#done

retval=-1 # as return value
function get_file_list(){
    retval=-1
    counter=0
    for i in $(ls $1);
        do
        retval[$counter]=$i
        let counter++
        done
}

get_file_list $1

echo ${retval[@]} #echo whole array