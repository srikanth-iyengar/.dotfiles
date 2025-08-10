#!/bin/bash

json_out=`lsblk --output MOUNTPOINTS,FSUSED,FSAVAIL --json`

filtered_list=`echo $json_out | jq '.blockdevices' | jq 'map(select((.mountpoints[] or length > 0) and .fsavail > 0))'`

echo $filtered_list
