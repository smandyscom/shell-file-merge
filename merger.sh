#!/bin/zsh

echo $1; #input argument
echo $2;

retval=-1 # as return value
function get_file_list(){
    unset retval
    retval=-1
    counter=0
    for i in $(ls $1);
        do
        retval[$counter]=$i
        let counter++
        done
}

#cache list1
get_file_list $1
list1=("${retval[@]}")
#cache list2
get_file_list $2
list2=("${retval[@]}")

#check which one is fewer
if [ ${#list1[@]} -lt ${#list2[@]} ];then
fewer=("${list1[@]}")
other=("${list2[@]}")
else
fewer=("${list2[@]}")
other=("${list1[@]}")
fi

#use fewer one as key to check if redundant in other directory

echo ${retval[@]} #echo whole array