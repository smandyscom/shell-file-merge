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

#from https://stackoverflow.com/questions/3685970/check-if-a-bash-array-contains-a-value
containsElement () {
  local e match="$1"
  shift
  for e; do [[ "$e" == "$match" ]] && return 0; done
  return 1
}


#cache list1
get_file_list $1
list1=("${retval[@]}")
#cache list2
get_file_list $2
list2=("${retval[@]}") #copy of original array

#check which one is fewer
if [ ${#list1[@]} -lt ${#list2[@]} ];then
fewer=("${list1[@]}")
other=("${list2[@]}")
else
fewer=("${list2[@]}")
other=("${list1[@]}")
fi

#use fewer one as key to check if redundant in other directory
for i in ${fewer[@]}
    do
        containsElement $i ${other[@]}
        if [ $? -eq 0 ]
        then
        echo $i
        redundant+=($i) #append element
        fi
    done

echo ${retval[@]} #echo whole array
echo ${redundant[@]}