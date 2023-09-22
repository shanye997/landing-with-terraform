#!/usr/bin/env bash

exampleDir=$(ls .)

reg='^101-.*'

for file in $exampleDir;do
if [[ $file =~ $reg ]]
   then
        # echo $file
      terraform-docs -c .terraform-docs.yml $file
   fi
done