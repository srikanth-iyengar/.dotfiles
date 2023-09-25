#!/bin/zsh
alias vim="nvim"
alias tmx="tmux -u"

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
. "$HOME/.cargo/env"
source ~/.dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
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
