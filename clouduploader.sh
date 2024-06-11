#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <file_path> <target_dir>"
  exit 1
fi

# Assign positional arguments to variables
FILE_PATH=$1
TARGET_DIR=$2

# Check if the file exists
if [ ! -f "$FILE_PATH" ]; then
  echo "File not found!"
  exit 1
fi

# Upload the file to S3
aws s3 cp "$FILE_PATH" "s3://$TARGET_DIR/"

# Provide feedback
if [ $? -eq 0 ]; then
  echo "Upload successful!"
else
  echo "Upload failed!"
fi
