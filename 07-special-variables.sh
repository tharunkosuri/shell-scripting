#!/bin/bash

### Special Variables ###

echo "It will print all the Special variables :: $@"
echo "no. of args passed to the script :: $#"
echo "first variable passed :: $1"
echo "script name :: $0"
echo "real path :: $(realpath $0)"
echo "who is running current script :: $USER"
echo "directory of current script :: $PWD"
echo "home directory of current user :: $HOME"
echo "pid of current script :: $$"
sleep 10 & ## to the command in background
echo "pid of the command running in background now :: "$!"
wait $!  # script waits untill $! command completes
echo "line number:: $LINENO"
echo "previous command exit status :: $?"
echo "total time executed for the script :: $SECONDS"
