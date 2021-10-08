#!/bin/bash

# docker to “remove all” images and containers
alias docker-rma='docker rm $(docker ps -a -q) && docker rmi $(docker images -a -q)'

# run pit-cli using node.js (make sure the path is correct and the app is built)
alias pit='node ~/code/pit-cli/dist/index.js'

# run a static http server on port 8000 serving from the active directory
alias pyserve='python3 -m http.server 8000' 

# replace default cat with bat(cat) for fancy display
alias cat='batcat --pager=never'
# run the original cat with different alias
alias ccat='/usr/bin/cat'

# list and remove node_modules folders recursively
alias list-node-modules="find . -name 'node_modules' -type d -prune"
alias remove-node-modules="find . -name 'node_modules' -type d -prune -exec rm -rf '{}' +"

# grep from history
alias hgrep="history | grep"

# NordVPN
alias nvpnusa="nordvpn c United_States"
alias nvpnhun="nordvpn c Hungary"
alias nvpnd="nordvpn d"
alias nvpnst="nordvpn status"