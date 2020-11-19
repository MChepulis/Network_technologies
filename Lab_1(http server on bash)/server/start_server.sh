#!/bin/bash

PORT=8080
touch google_table_id.sh

if [ "$#" == 1 ] 
then
  read GOOGLE_TABLE_ID < ${1}
  echo "GOOGLE_TABLE_ID=$GOOGLE_TABLE_ID"
  echo "GOOGLE_TABLE_ID=$GOOGLE_TABLE_ID" > google_table_id.sh
fi


while true 
do 
  trap 'break' INT
  echo "port = $PORT"
  ncat -l -p $PORT -e request_handler.sh
  
done

rm google_table_id.sh
