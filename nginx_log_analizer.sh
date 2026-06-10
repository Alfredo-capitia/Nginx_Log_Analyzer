s#!/bin/bash

set -euo pipefail

FILE_LOG="/home/levelup007/devops-course/linux/nginx_log_analizer/nginx-access.log"

read_log() {
  echo "=========Top 5  ip address with most requests========"
  awk '{print $1}' $FILE_LOG | sort | uniq -c | sort -rn | head -5

  echo " =============== Top 5 paths with most requests  ==============="
  awk '{print $7}' $FILE_LOG | sort | uniq -c | sort -rn | head -5

 echo " ========== Top 5 status code with most requests ================ "
 awk '{print $9}' $FILE_LOG | sort | uniq -c | sort -rn | head -5

 echo " ============ Top 5 user agents ============" 
  awk '{print $12}' $LOG_FILE | sort | uniq -c | sort -rn | head -5
}

read_log
