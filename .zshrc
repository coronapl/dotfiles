################################################################################
# Maintainer:
#     @coronapl
# File:
#     .zshrc
################################################################################

# Simple prompt
export PS1="%1~ $ "

# Colors
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

alias grep="grep --color=always"
alias egrep="egrep --color=always"
alias fgrep="fgrep --color=always"

# Move to important directories
alias ws="cd ~/Workspace"
alias docs="cd ~/Documents"

# Open important files
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"

# Confirm before overwriting something
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

# Clear terminal screen
alias c="clear"

# Manage dotfiles as a bare repository
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
# Do not show untracked files
config config --local status.showUntrackedFiles no

# Load Node Version Manager
export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

