#!/bin/bash

echo -e "\n\e[34mCreating backup tarball from Home folder...\n\e[39m"

tar \
  -czf $HOME/home-$(date +%Y-%m-%d-%H-%M-%S).tar.gz \
  --exclude node_modules \
  --exclude build \
  --exclude dist \
  --exclude out \
  --exclude .nuxt \
  --exclude .next \
  --exclude .pytest_cache \
  --exclude .venv \
  $HOME/code \
  $HOME/.ssh \
  $HOME/.bashrc \
  $HOME/.gitconfig \
  $HOME/.pitconfig.json 

echo -e "\n\e[32mBackup complete\n\e[39m"
