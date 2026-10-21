#!/bin/bash

var1=10
var2=20

echo "$var1+$var2"  # This will give output 10+20

echo "$(($var1+$var2))" # This will give output 30

declare -i count=5 # I am declaring this as integer
count=count+1

echo "Count is : $count"

fruits=("Apple" "banana "papaya") # This is called as array

echo "All fruits : ${fruits[@]}"   # @ all 
echo "first fruit : $first{fruits[0]}"
echo "second fruit : $first{fruits[1]}"

name="Tharun"

echo "${name}Kosuri"  # ${var}