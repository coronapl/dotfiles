# == Oh My Zsh Cofiguration ==

# Path
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="robbyrussell"

# Plugins
plugins=(git aws)

# ?
source $ZSH/oh-my-zsh.sh

# == General ==

# Load Node Version Manager
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# AWS default profile
export AWS_PROFILE="dev-app"

# Confirm before overwriting something
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

# Clear terminal screen
alias c="clear"

# Move to important directories
alias docs="cd ~/Documents"
alias ws="cd ~/workspace"
alias cma="cd ~/workspace/caremates-app"

# Shortcuts
alias asl="aws sso login"
alias cma-run="cd ~/workspace/caremates-app && pnpm run dev"
alias nvim-conf="cd ~/.config/nvim"

# Completions
source ~/scripts/gh-completions.zsh

