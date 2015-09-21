#!/usr/bin/env bash
set -e

# See README.md for SETUP instructions

BUCKET_NAME=$1

if [ "${BUCKET_NAME}" == "" ]; then
  echo "Usage: $0 bucket_name"
  echo ""
  echo "See also that you have ~/aws/credentials and ~/aws/config set up."
  echo "Run 'aws configure' if needed."
  echo ""
  echo "N.B. Bucket region is eu-west-1."
  exit 1
fi

grunt build
aws s3 cp --recursive ./dist/ s3://${BUCKET_NAME}
