method=${1}

if [ $method == "GET" ]
then
  file_to_save_path=${2}
  response=$(curl 0.0.0.0:8080 -s -w "\n%{response_code}" -X GET)
  tmp=($response)
  resp_code=${tmp[-1]}
  if [ $resp_code == 200 ]
  then 
    echo "Load table to file: $file_to_save_path"
    table_body=${response:0:${#response}-3}
    echo $table_body > $file_to_save_path
  else
    echo "Somthing goes wrong"
  fi
elif [ $method == "UPDATE" ]
then
  table_id=${2}
  response=$(curl 0.0.0.0:8080/$table_id -s -w "\n%{response_code}" -X UPDATE)
  tmp=($response)
  resp_code=${tmp[-1]}
  if [ $resp_code -eq 200 ]
  then 
    echo "Table id updated"
    echo "New table id = $table_id"
  else
    echo "Somthing goes wrong"
  fi
else
  echo "unknown method"
fi

