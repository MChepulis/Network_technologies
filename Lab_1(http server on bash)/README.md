# Simple HTTP server on a bash for a download of google tables


## Requests
* UPDATE - request for setting google table ID.

* GET - request for getting table with CSV format.

## Start server
start_server.sh - script to start the server.

The server is deployed on the port 8080.

As an argument, you can pass a file that contains the table ID.


## my_mini_ui
my_mini_ui is Mini UI for simple requests.
### Arguments
 UPDATE "new_id" - similar to UPDATE-request with ID="new_id".

 GET "path/data.csv" - similar to GET-request and save table into "path/data.csv".

## Examples

### UPDATE
curl 0.0.0.0:8080/new_id -X UPDATE


### GET

curl 0.0.0.0:8080 -X GET

### my_mini_ui

my_mini_ui UPDATE new_id

my_mini_ui GET path/data.csv

