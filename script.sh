URL_CURL_CHECK="localhost:5008/"
VAR_A=$(curl "$URL_CURL_CHECK" | grep -o "HTTP/1.1 200 OK")
VAR_B="HTTP/1.1 200 OK"
echo
if [ "$VAR_A" != "$VAR_B" ]; then
    echo "Not equal ..."
else [ "$VAR_A" = "$VAR_B" ]
    echo "It's a match"
fi
echo
echo "Validate VARs: "
echo "$VAR_A"
echo "$VAR_B"
