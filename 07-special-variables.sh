#!/bin/bash

### Special Variables ###

echo "It will print all the Special variables :: $@"
echo "no. of args passed to the script :: $#"
echo "first variable passed :: $1"
echo "script name :: $0"
echo "real path :: $(realpath $0)"
echo "who is running current script :: $USER"
