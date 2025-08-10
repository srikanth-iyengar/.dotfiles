#!/bin/bash

json_out=`lsblk --bytes --output MOUNTPOINTS,FSUSED,FSAVAIL --json`

echo "$json_out" | jq '
  .blockdevices
  | map(select((.mountpoints[]? != null) and (.fsavail > 0)))
  | map(.fsused / (.fsused + .fsavail) * 100)
  | add / length
'
