#!/bin/bash

# Set your access key ID and secret key directly
read -p "Enter aws access key: " awsaccesskey
read -p "Enter aws secret key: " awssecret
AWS_ACCESS_KEY_ID=$awsaccesskey
AWS_SECRET_ACCESS_KEY=$awssecret

# Optionally, you can set the session token if required
# AWS_SESSION_TOKEN="YOUR_SESSION_TOKEN"

# Write to .env file
echo "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" > .env
echo "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY" >> .env
# echo "AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN" >> .env

echo "Environment variables written to .env file."
