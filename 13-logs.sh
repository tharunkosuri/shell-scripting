#!/bin/bash

user_id=$(id -u)
logs_folder="/var/log/shell_practice"
logs_file="${logs_folder}/${0}.log"  # scriptname saved as logfile name

if [ $user_id -ne 0 ]; then
    echo "Please run the script with sudo access"
    exit 1
fi

mkdir -p $logs_folder  # If folder present then it will not create the folder.So we didnt get error

echo "Script started execution at $(date +"%F %T")"

validate(){
    if [ $1 -ne 0 ]; then
        echo "${2}... is failed" | tee -a $logs_file  # It will show in screen as well as in logs file
        exit 1
    else
         echo "${2}... is success" | tee -a $logs_file # It will show in screen as well as in logs file
    fi

}

# Install Nginx
dnf install nginx -y &>> $logs_file
validate $? "Nginx instllation"


# Install mysql
dnf install mysql -y &>> $logs_file
validate $? "mysql instllation"

echo "Script execution completed at $(date +"%F %T")"
