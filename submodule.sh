#! /bin/bash

namespaces=(aliyun alibaba terraform-alicloud-modules)
next_offset=0
for np in ${namespaces[@]};
do
  while true
  do
    response=$(curl https://registry.terraform.io/v1/modules/${np}?limit=100\&offset=${next_offset})
    next_offset=$(echo ${response} | jq -r ".meta.next_offset")
    modules=$(echo ${response} | jq -r ".modules[].source")
    for mod in ${modules[@]};
    do
      echo $mod
      mod=$(echo $mod | sed -e "s/https:\/\/github.com\//git@github.com:/g")
      arr=(${mod//\// })
      git submodule add "$mod.git" modules/${arr[1]}
    done
    if [[ ${next_offset} == null ]]; then
      next_offset=0
      break
    fi
  done
done