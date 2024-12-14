#!/bin/zsh

alias vim=nvim
alias g=git
alias open=xdg-open
# source /usr/share/bash-completion/completions/git
# __git_complete g __git_main

# SDKMAN conf
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Function to activate NVM
activate_nvm() {
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
    echo "NVM has been activated."
}


#__git_branch() {
#    output=$(git branch --show-current 2>/dev/null)
#    if [ $? -eq 0 ]; then
#      echo "git:($output)"
#    fi
#    unset output
#}
#
#__git_status() {
#    changes=`git status --porcelain 2>/dev/null`
#    if [ $? -ne 0 ]; then
#        return
#    elif [[ $changes ]]; then
#        echo ''
#        return
#    fi
#}

# build_prompt() {
#     local exitCode="$?"
#     local prompt=''

#     prompt+="$(tput setaf $((exitCode == 0 ? 47 : 1)))"

#     prompt+='  '
#     prompt+="$(tput bold; tput setaf 87)"
#     prompt+='\W'
#     prompt+="$(__git_branch)$(__git_status)"
#     prompt+="$(tput sgr0)  "

#     PS1="$prompt"
#     unset prompt
#     unset exitCode
# }

#__d_hist() {
#    offset=0
#    ids=$(history | grep -E "(\s|^)ls(\s|$)|(\s|^)clear(\s|$)|(\s|^)history(\s|$)"\
#        | awk '{print $1}')
#    for id in $ids; do
#        ((target=$id-$offset))
#        history -d $target
#        ((offset=offset+1))
#    done
#}

activate_android_tools() {
    export ANDROID_SDK_ROOT=$HOME/Android
    export PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/emulator
}

update_resume() {
    scp srikanth@latex.srikanthk.net:/home/srikanth/docs/resume/resume.pdf ~/Documents/Resume_Srikanth_Iyengar.pdf
}

export ANDROID_HOME=$HOME/Android
export PATH="${PATH}:${ANDROID_HOME}/cmdline-tools/latest/bin:${ANDROID_HOME}/platform-tools"

export FLUTTER_HOME=$HOME/apps/flutter
export PATH="${PATH}:${FLUTTER_HOME}/bin"
export PATH="${PATH}:$HOME/bin"

export PATH="$PATH:$HOME/apps/go/bin"
export GOPATH="$HOME/gopath"
export PATH="$PATH:$HOME/gopath/bin"
if command -v rustc >/dev/null 2>&1; then
 # source "$(rustc --print sysroot)"/etc/zsh_completion.d/cargo
fi

export PATH="$PATH:$HOME/bin"

# source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#
export JDTLS_JVM_ARGS="-javaagent:$HOME/.local/share/java/lombok.jar"
