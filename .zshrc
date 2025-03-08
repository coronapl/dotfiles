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
# Use Neovim instead of vim
alias vim="nvim"
alias vi="nvim"

# Load Node Version Manager
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# AWS default profile
export AWS_PROFILE="REPLACE_HERE"

# Confirm before overwriting something
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

# Clear terminal screen
alias c="clear"

# Move to important directories
alias docs="cd ~/Documents"
alias ws="cd ~/workspace"

# Shortcuts
alias asl="aws sso login"

# Completions
source ~/scripts/gh-completions.zsh

