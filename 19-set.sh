#!/bin/bash

set -e # If there is any error it will exit automatically
user_id=$(id -u)
logs_folder="/var/log/shell_practice"
logs_file="${logs_folder}/${0}.log"  # scriptname saved as logfile name
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

trap 'echo "Error at ${LINENO} , command: "${BASH_COMMAND"' ERR

if [ $user_id -ne 0 ]; then
    echo "Please run the script with sudo access"
    exit 1
fi

mkdir -p $logs_folder  # If folder present then it will not create the folder.So we didnt get error

echo "Script started execution at $(date +"%F %T")" &>> $logs_file

for package in $@
do
    dnf list installed $package &>> $logs_file
    if [ $? -ne 0 ]; then
        echo "Going to install :${package}"
        dnf install ${package} -y &>> $logs-file
    else
        echo -e "${package} already installed.. ${Y}SKIPPING${N}"
    fi
done

echo "Script execution completed at $(date +"%F %T")" &>> $logs_file
