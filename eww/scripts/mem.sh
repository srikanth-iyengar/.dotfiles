#!/bin/bash

mem_output=$(free | awk '
NR>1 {
  if(FNR == 2) {
    printf("{")
  }
  printf("\"%s\": {\"used\": %d, \"total\": %d}, ", $1, $3, $2)
}
END {
  printf("}")
}
')

# Remove the trailing comma and space before the closing brace
mem_output=$(echo $mem_output | sed 's/, }/}/')

echo $mem_output | jq

