7z a -r -tzip deploy.zip *.js *.pug node_modules/*

aws lambda delete-function --function-name notifications-send-email 2> /dev/null

aws lambda create-function --function-name notifications-send-email \
--description "Send Nightly Emails for Notifications app" \
--zip-file fileb://deploy.zip \
--role role-name \
--tags "owner=owner-name" \--environment Variables="{ \
note_host=computername, \
note_database=notifications, \
note_user=username, \
note_password=pass, \
mds_host=computername, \
mds_database=mdsdb, \
mds_user=username, \
mds_password=pass, \
EMAIL_SENDER=asheville_notifications@ashevillenc.gov, \
emailhashkey='somehashkey', \
unsubURL='https://ashevillenc.gov/unsubscribe/' \
}" \
--vpc-config SubnetIds=subnet-id,subnet-id2,SecurityGroupIds=sg-id \
--handler index.handler --runtime nodejs10.x