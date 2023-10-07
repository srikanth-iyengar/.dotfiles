#!/bin/zsh

# My custom alias
alias vim="nvim"
alias tmx="tmux -u"

# SDKMAN conf
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Cargo thing
. "$HOME/.cargo/env"

# Golang version manager
source "/home/srikanth/.gvm/scripts/gvm"
# Function to activate NVM
activate_nvm() {
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
    echo "NVM has been activated."
}

# Function to deactivate NVM
deactivate_nvm() {
    unset NVM_DIR
    unset NVM_BIN
    unset NVM_CD_FLAGS
    unset NVM_CURRENT_VERSION
    echo "NVM has been deactivated."
}


readmd() {
    if [ -z "$1" ]; then
        echo "Usage: readmd <filename>"
    else
        gum format < "$1" | gum pager
    fi
}

notify() {
    arg1="$1"
    arg2="$2"
    
    code="$3"
    msg="no msg"

    if [ $code -eq 0 ]; then
        msg="$arg1"
    else
        msg="$arg2"
    fi
    curl https://ntfy.srikanthk.tech/shell-commands -d "$msg"
}

d_hist() {
  local commands_to_delete=("ls" "clear", "cd", "exit", "history")
  local history_file="$HISTFILE"
  
  for cmd in "${commands_to_delete[@]}"; do
    sed -i "/$cmd/d" "$history_file"
  done

  fc -R
}

enter() {
    docker exec -i -t $1 /bin/bash
}

# Just homebrew thing
test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
test -r ~/.bash_profile && echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bash_profile
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.profile
