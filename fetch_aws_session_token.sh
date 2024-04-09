#!/bin/bash
# Replace <account_id>, <username>, and prompt for MFA token code
read -p "Enter username: " awsusername
read -p "Enter account ID: " awsaccountid
read -p "Enter MFA token code: " mfatokencode
# output=$(aws sts get-session-token --serial-number arn:aws:iam::$awsaccountid:mfa/$awsusername --token-code $mfatokencode)

# export AWS_ACCESS_KEY_ID=$(echo $output | jq -r '.Credentials.AccessKeyId')
# export AWS_SECRET_ACCESS_KEY=$(echo $output | jq -r '.Credentials.SecretAccessKey')
# export AWS_SESSION_TOKEN=$(echo $output | jq -r '.Credentials.SessionToken')

# # Prompt for MFA token code
# read -p "Enter MFA token code: " mfatokencode

# Fetch session token and write to .env file
aws sts get-session-token --serial-number arn:aws:iam::$awsaccountid:mfa/$awsusername --token-code $mfatokencode | jq -r '"AWS_ACCESS_KEY_ID=" + .Credentials.AccessKeyId, "AWS_SECRET_ACCESS_KEY=" + .Credentials.SecretAccessKey, "AWS_SESSION_TOKEN=" + .Credentials.SessionToken' > .env
