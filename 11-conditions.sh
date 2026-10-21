#!/bin/bash

user_id=$(id -u)

if [$user_id -ne 0]; then
    echo "Please run the script with sudo access"
    exit 1
fi

# In shell scripting we need to exit if we think that the condition will fail. by default it wont exit

# It is our responsibility to check whether every command is success or not
echo "Proceeding...."  # even if we get error it will proceed as we are not exiting it


# Install Nginx
dnf install nginx -y
if [$? -ne 0]; then
    echo "Nginx instllation is failed"
    exit 1
else
    echo "Nginx installation is success"
fi

# Install mysql
dnf install mysql -y
if [$? -ne 0]; then
    echo "mysql client instllation is failed"
    exit 1
else
    echo "mysql client installation is success"
fi


echo "Still proceeding......."