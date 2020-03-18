#!/bin/bash

function git-co {
  local branch=$(git branch -a | grep -m 1 $1)
  if [[ ${#branch} == 0 ]]; then
    echo -e "\e[31m[-] No such branch\n\e[39m"
  fi
  if [[ $branch == *"remotes/origin"* ]]; then
    local cutName=${branch:17}
    git checkout $cutName
    git pull origin $cutName
  else 
    git checkout $branch
  fi
  return 0
}