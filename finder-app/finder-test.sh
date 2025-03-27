#!/bin/bash
#set +x
numfiles=${1:-10}
writestr=${2:-"AELD_IS_FUN"}

# Create an empty directory
mkdir -p /tmp/aeld-data

# Get the username from conf/username.txt
username=$(cat conf/username.txt)

# Loop to create numfiles files
for i in $(seq 1 $numfiles); do
    ./finder-app/writer.sh /tmp/aeld-data/${username}${i}.txt "$writestr"
done

# Run the finder script
output=$(./finder-app/finder.sh /tmp/aeld-data "$writestr")

# Expected output
expected_output="The number of files are $numfiles and the number of matching lines are $numfiles"

# Compare the output
if [ "$output" == "$expected_output" ]; then
    echo "success"
else
    echo "error"
fi