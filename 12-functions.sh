#!/bin/bash

user_id=$(id -u)

if [ $user_id -ne 0 ]; then
    echo "Please run the script with sudo access"
    exit 1
fi

validate(){
    if [ $1 -ne 0 ]; then
        echo "${2}... is failed"
        exit 1
    else
         echo "${2}... is success"
    fi

}

# Install Nginx
dnf install nginx -y
validate $? "Nginx instllation"


# Install mysql
dnf install mysql -y
validate $? "mysql instllation"
