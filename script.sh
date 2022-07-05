URL_CURL_CHECK="localhost:5008/"
VAR_A=$(curl "$URL_CURL_CHECK"  | grep "200 OK")
VAR_B="200 OK"
echo
if [ "$VAR_A" != "$VAR_B" ]; then
    echo "equal ..."
else [ "$VAR_A" = "$VAR_B" ]
    echo "It's not a match"
fi
echo
echo "Validate VARs: "
echo "$VAR_A"
echo "$VAR_B"
