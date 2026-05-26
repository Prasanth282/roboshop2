#!/bin/bash 

R=\e[31m
G=\e[32m
N=\e[0m
Y=\e[33m

FOLDER_PATH="/var/log/shell-scripts"
SCRIPT_NAME="$0"
LOG_FILE="$FOLDER_PATH/$SCRIPT_NAME.log"

mkdir -p $FOLDER_PATH

VALIDATE() {
    if [ $1 -eq 0 ]
    then 
        echo " $2 is success "
    else 
        echo "$2 is failed "
    fi     
    

}

check_root(){
USERID=$(id -u)
if [ $USERID -ne 0 ]
then 
    echo "error :: you don't have root user privlages "
    exit 1
else
    echo " you have root user privlages "
fi 
}

print_time () {
    TOTAL_TIME=${$END_TIME-$START_TIME}
    echo " total time taken to execute the script is :: $TOTAL_TIME 
}