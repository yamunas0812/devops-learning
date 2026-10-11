#!/bin/sh

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 |cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R='\033[0;31m'
G='\033[0;32m'
Y='\033[1;33m'
VALIDATE(){
    if [ $1 -ne 0 ]
    then    
        echo -e "$2...$R FAILURE $M"
    else
        echo -e  "$2.. $G SUCCESS $M"
    fi
}

if [ USERID -ne 0 ]
then 
    echo "please run the script with root user"
else
    echo "you are super user"
fi

for i in $@
do 
    echo "Package to install: $i"
    dnf list installed $i &>>$LOGFILE
    if [ $? -ne 0 ]
    then
        echo -e "$i is already installed.. $Y Skipping $M"
    else
        dnf install $i -y &>>$LOGFILE
        echo "$i not installed.. installing"
    fi
done


