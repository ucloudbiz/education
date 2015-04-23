#!/bin/bash

export ST_AUTH=https://api.ucloudbiz.olleh.com/storage/v1/auth
echo  -n "swift user id ( ex. cse2.kt@gmail.com ) : "
read user
echo  -n "swift user apikey : "
read apikey
echo "alias st='swift -A $ST_AUTH -U $user -K $apikey'" > /tmp/storage_user
echo "you have to execute manually : source /tmp/storage_user"
