rm deploy.zip 2> /dev/null

7z a -r -tzip deploy.zip *.js sendPermitMsgs/* common/* node_modules/*

aws lambda update-function-code --function-name notifications-send-msgs --zip-file fileb://deploy.zip

# aws lambda update-function-configuration --function-name notifications-send-msgs \

# aws lambda delete-function --function-name notifications-send-msgs