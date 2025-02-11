
#!/bin/bash

message=$( fianu console deploy --commit $1 --path $2 2>&1)

if [[ $message =~ "$3" ]];
then
    echo "message contains input string"
    echo "got $message"
    echo "want $3"
    exit 1
else
    echo "message does not contain message string"
    echo "got $message"
    echo "want $3"
    exit 0
fi
