#!/bin/bash

prog_log()
{
run="${program// /_}"
    LOG_FILE=/var/log/$run.log
    LOGTIME=`date "+%d-%m-%Y %H:%M:%S"`
    if [ "$LOG_FILE" == "" ]; then
    LOG=$LOGTIME;
      else
        LOG=$LOG_FILE
    touch $LOG
        if [ ! -f $LOG ]; then echo "ERROR!! Cannot create log file $LOG. Exiting."; exit 1; fi
    echo $LOGTIME | tee -a $LOG;
      fi
echo " " | tee -a $LOG
$program 2>&1 | tee -a $LOG 
}
echo "Run custom logger for Command:"
read program
prog_log
