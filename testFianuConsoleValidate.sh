#!/bin/bash

message=$( fianu console validate --path $1 2>&1)

if [[ $message =~ "$2" ]];
then
    echo "message contains input string"
    exit 0
else
    echo "message does not contain input string"
    echo "got $message"
    echo "want $2"
    exit 1
fi
