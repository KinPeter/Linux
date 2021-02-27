#!/bin/bash

function ssh-work {
  if [ ! -f "$HOME/.ssh/id_rsa_work" ]; then
    echo -e "\e[31m[-] Could not change default SSH key\n\e[39m"
    return 1
  else
    chmod 777 "$HOME/.ssh/id_rsa"
    mv "$HOME/.ssh/id_rsa" "$HOME/.ssh/id_rsa_personal"
    mv "$HOME/.ssh/id_rsa.pub" "$HOME/.ssh/id_rsa.pub_personal"
    mv "$HOME/.ssh/id_rsa_work" "$HOME/.ssh/id_rsa"
    mv "$HOME/.ssh/id_rsa.pub_work" "$HOME/.ssh/id_rsa.pub"
    chmod 700 "$HOME/.ssh/id_rsa"
    echo -e "\e[32m[+] Default SSH key set to work\n\e[39m"
    return 0
  fi
}

function ssh-personal {
  if [ ! -f "$HOME/.ssh/id_rsa_personal" ]; then
    echo -e "\e[31m[-] Could not change default SSH key\n\e[39m"
    return 1
  else
    chmod 777 "$HOME/.ssh/id_rsa"
    mv "$HOME/.ssh/id_rsa" "$HOME/.ssh/id_rsa_work"
    mv "$HOME/.ssh/id_rsa.pub" "$HOME/.ssh/id_rsa.pub_work"
    mv "$HOME/.ssh/id_rsa_personal" "$HOME/.ssh/id_rsa"
    mv "$HOME/.ssh/id_rsa.pub_personal" "$HOME/.ssh/id_rsa.pub"
    chmod 700 "$HOME/.ssh/id_rsa"
    echo -e "\e[32m[+] Default SSH key set to personal\n\e[39m"
    return 0
  fi
}