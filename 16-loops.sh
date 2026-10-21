#!/bin/bash

user_id=$(id -u)
logs_folder="/var/log/shell_practice"
logs_file="${logs_folder}/${0}.log"  # scriptname saved as logfile name

if [ $user_id -ne 0 ]; then
    echo "Please run the script with sudo access"
    exit 1
fi

mkdir -p $logs_folder  # If folder present then it will not create the folder.So we didnt get error

echo "Script started execution at $(date +"%F %T")" &>> $logs_file

validate(){
    if [ $1 -ne 0 ]; then
        echo "${2}... is failed" | tee -a $logs_file  # It will show in screen as well as in logs file
        exit 1
    else
         echo "${2}... is success" | tee -a $logs_file # It will show in screen as well as in logs file
    fi

}

for package in $@
do
    dnf list installed $package &>> $logs_file
    if [ $? -ne 0 ]; then
        echo "Going to install :${package}"
        dnf install ${package} -y &>> $logs-file
        validate $? "installing ${package}"
    else
        echo "${package} already installed.. SKIPPING"
    fi
done

echo "Script execution completed at $(date +"%F %T")" &>> $logs_file
