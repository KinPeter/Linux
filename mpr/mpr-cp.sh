#!/bin/bash

source $HOME/code/linux/bash-mouse.sh
mpr cp
notify-send "G502 Profile set to 1 ($(cat $HOME/.g502gameprofile))"
