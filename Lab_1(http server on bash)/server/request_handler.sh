#!/bin/bash
source google_table_id.sh
source config.sh

resp_h="HTTP/1.1"
read req_method path tmp_tail


if [ $req_method == "GET" ]
then
  if [ -z "$GOOGLE_TABLE_ID" ]
  then 
    echo -e "$resp_h 404 Not Found\n"
    echo -e "empty table ID\n"
  else
    response=$(curl -s -w "\n%{response_code}" "https://docs.google.com/spreadsheets/d/$GOOGLE_TABLE_ID/gviz/tq?tqx=out:csv")
    tmp=($response)
    resp_code=${tmp[-1]}
    body=${response:0:${#response}-3}

    if [ $resp_code == 200 ]
    then 
      echo -e "$resp_h 200 OK\n"
      echo $body

    else
      echo -e "$resp_h $resp_code Error with code $resp_code\n"
    fi

  fi

elif [ $req_method == "UPDATE" ]
then 

  IFS='/' read -ra tmp <<< $path
  new_table_id=${tmp[1]}
  $GOOGLE_TABLE_ID=new_table_id
  echo "GOOGLE_TABLE_ID=$GOOGLE_TABLE_ID" > table_id.sh
  echo -e "$resp_h 200 OK \n"
  echo "new id = $new_table_id"

  
else
  echo -e "$resp_h 405 Method Not Allowed\n"
fi






