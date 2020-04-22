#!/bin/bash

function git-co {
  local branch=$(git branch -a | grep -m 1 $1)
  if [[ ${#branch} == 0 ]]; then
    echo -e "\e[31m[-] No such branch\n\e[39m"
  fi
  if [[ $branch == *"remotes/origin"* ]]; then
    local cutName=${branch:17}
    echo -e "\e[32m[+] Changing to branch: $cutName...\n\e[39m"
    git checkout $cutName
    git pull origin $cutName
  else
    echo -e "\e[32m[+] Changing to branch: $branch...\n\e[39m"
    git checkout $branch
  fi
  return 0
}

function git-review {
  echo -e "\e[31m[-] Fetching from origin...\n\e[39m"
  git fetch
  local branch=$(git branch -a | grep -m 1 $1)
  if [[ ${#branch} == 0 ]]; then
    echo -e "\e[31m[-] No such branch\n\e[39m"
  fi
  if [[ $branch == *"remotes/origin"* ]]; then
    local cutName=${branch:10}
    echo -e "\e[32m[+] Changing to remote branch: $cutName...\n\e[39m"
    git checkout $cutName
  else
    echo -e "\e[31m[-] Branch is checked out locally\n\e[39m"
  fi
  return 0
}

function git-pulo {
  local branch=$(git rev-parse --abbrev-ref HEAD)
  echo -e "\e[32m[+] Pulling $branch from origin...\n\e[39m"
  git pull origin $branch
  return 0
}
