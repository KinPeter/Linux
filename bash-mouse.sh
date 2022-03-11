#!/bin/bash

g502mouseName=""

function mpr {
  local profile=$1

  if [[ $# == 0 ]]; then
    mpr-get
  elif [[ $profile == "solo" ]]; then
    mpr-configureAndSetSolo
  elif [[ $profile == "cp" ]]; then
    mpr-configureAndSetCyberpunk
  else 
    mpr-set $profile
  fi
}

function getMyMouseName {
  local listItem=$(ratbagctl list | grep 'G502')  
  IFS=':'
  read -a mouseName <<< "$listItem"
  unset IFS
  g502mouseName=$mouseName
}

# Set the mouse profile to 0, 1 or 2
function mpr-set {
  local profile=$1
  if [[ $profile != 0 && $profile != 1 && $profile != 2 ]]; then
    echo "Profile not available"
    return 1
  fi

  getMyMouseName
  ratbagctl $g502mouseName profile active set $profile
  if [[ $profile == 0 ]]; then 
    echo "G502 Profile set to $profile (Default)"
  else
    local game=$(<$HOME/.g502gameprofile)
    echo "G502 Profile set to $profile ($game)"
  fi
  return 0
}

function mpr-get {
  getMyMouseName
  local profile=$(ratbagctl $g502mouseName profile active get)
  local game=$(<$HOME/.g502gameprofile)
  if [[ $profile == 0 ]]; then
    echo "G502 active profile is $profile (Default)"
    echo "Profile 1 is set to $game"
  else
    echo "G502 active profile is set to $game"
  fi
}

# Buttons on the G502
# 0 left 
# 1 right
# 2 middle 
# 3 left side closest
# 4 left side second
# 5 left side far-down
# 6 top-left closer
# 7 top-left farther
# 8 top middle small
# 9 wheel right
# 10 wheel left

g502defaultProfile=( 
  "button 1"  
  "button 2"
  "button 3"
  "button 4"
  "macro +KEY_LEFTMETA KEY_A -KEY_LEFTMETA"
  "macro +KEY_LEFTCTRL KEY_S -KEY_LEFTCTRL"
  "macro +KEY_LEFTCTRL KEY_C -KEY_LEFTCTRL" 
  "macro +KEY_LEFTCTRL KEY_V -KEY_LEFTCTRL"
  "macro +KEY_LEFTALT KEY_F2 -KEY_LEFTALT" 
  "macro +KEY_LEFTCTRL +KEY_LEFTMETA KEY_RIGHT -KEY_LEFTMETA -KEY_LEFTCTRL"
  "macro +KEY_LEFTCTRL +KEY_LEFTMETA KEY_LEFT -KEY_LEFTMETA -KEY_LEFTCTRL"
)
function mpr-resetDefault {
  getMyMouseName
  for i in ${!g502defaultProfile[@]};
  do
    echo "ratbagctl $g502mouseName profile 0 button $i action set ${g502defaultProfile[$i]}"
  done
  echo "Default profile buttons configured"
}

g502ProfileSolo=(
  "button 1"  
  "button 2"
  "button 3"
  "macro +KEY_LEFTALT KEY_X -KEY_LEFTALT"
  "macro +KEY_LEFTALT KEY_Q -KEY_LEFTALT"
  "button 4"
  "macro +KEY_LEFTALT KEY_E -KEY_LEFTALT"
  "macro +KEY_LEFTALT KEY_R -KEY_LEFTALT"
  "button 3"
  "macro KEY_Z"
  "macro KEY_R"
)
function mpr-configureAndSetSolo {
  getMyMouseName
  for i in ${!g502ProfileSolo[@]};
  do
    ratbagctl $g502mouseName profile 1 button $i action set ${g502ProfileSolo[$i]}
  done
  echo "Profile 1 buttons configured"
  echo "Swords of Legends Online" > $HOME/.g502gameprofile
  mpr-set 1
}

g502ProfileCyberpunk=(
  "button 1"  
  "button 2"
  "button 3"
  "macro KEY_C"
  "macro KEY_F"
  "macro +KEY_LEFTCTRL KEY_S -KEY_LEFTCTRL"
  "button 3"
  "macro KEY_X"
  "button 3"
  "button 9"
  "button 10"
)
function mpr-configureAndSetCyberpunk {
  getMyMouseName
  for i in ${!g502ProfileCyberpunk[@]};
  do
    ratbagctl $g502mouseName profile 1 button $i action set ${g502ProfileCyberpunk[$i]}
  done
  echo "Profile 1 buttons configured"
  echo "Cyberpunk 2077" > $HOME/.g502gameprofile
  mpr-set 1
}