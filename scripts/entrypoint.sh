#!/bin/sh -l

./test_runner.sh

if [ $? != 0 ]; then
  printf "Execution error $?"
  exit 1
fi

echo ::set-output name=result::`cat $(pwd)/../evaluation_result.txt | base64 -w 0`
