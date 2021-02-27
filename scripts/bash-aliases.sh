#!/bin/bash

# docker to “remove all” images and containers
alias docker-rma='docker rm $(docker ps -a -q) && docker rmi $(docker images -a -q)'

# example alias for a nodejs script that needs to get the current folder path as "-p" parameter
# alias node-script='node ~/path/to/index.js -p $(pwd)'

# run pit-cli using dotnet (check and update path after build!)
alias pit='dotnet ~/code/pit-cli/bin/Debug/netcoreapp3.1/pit.dll'
