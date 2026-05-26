#!/bin/bash
START_TIME=$(date +%s)
source ./common.sh

check_root 

cp mongodb /etc/yum.repos.d/mongo.repo 
dnf install mongodb-org -y   &>> $LOG_FILE
VALIDATE $? "installing mongodb"

systemctl enable mongod 
VALIDATE $? "enabling mongodb"

systemctl start mongod
VALIDATE $? "starting mongodb"

sed -i 's/127.0.0.0/0.0.0.0/g' /etc/mongod.conf &>> $LOG_FILE
VALIDATE $? "allowing remote access to mongodb" 

systemctl restart mongod 
VALIDATE $? "restarting mongodb"

END_TIME=$(date +%s)

print_time

