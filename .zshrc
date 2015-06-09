source ~/antigen/antigen.zsh

antigen use oh-my-zsh
#
#GREP_OPTIONS is deprecated but I like the options defined by oh-my-zsh. Alias
#grep to use the correct thing
#This must be before antigen gets going
alias grep="/usr/bin/grep $GREP_OPTIONS"
unset GREP_OPTIONS

#main plugins that I need
antigen bundle git
antigen bundle vi-mode

#Nice syntax highlighting
antigen bundle zsh-users/zsh-syntax-highlighting

#set the theme
antigen theme agnoster

antigen apply

##### OPTIONS, ALIASES & CUSTOM FUNCTIONS #####

setopt AUTO_CD

# alias gvim="vim"

alias clear='printf "\033c"'

alias -g G="| grep"

alias gclean='git remote prune origin'

##### SSH-AGENT #####
#section stolen from github so ssh won't harrass me about the passphrase every
#time

# Note: ~/.ssh/environment should not be used, as it
#       already has a different purpose in SSH.

env=~/.ssh/agent.env

# Note: Don't bother checking SSH_AGENT_PID. It's not used
#       by SSH itself, and it might even be incorrect
#       (for example, when using agent-forwarding over SSH).

agent_is_running() {
    if [ "$SSH_AUTH_SOCK" ]; then
        # ssh-add returns:
        #   0 = agent running, has keys
        #   1 = agent running, no keys
        #   2 = agent not running
        ssh-add -l >/dev/null 2>&1 || [ $? -eq 1 ]
    else
        false
    fi
}

agent_has_keys() {
    ssh-add -l >/dev/null 2>&1
}

agent_load_env() {
    . "$env" >/dev/null
}

agent_start() {
    (umask 077; ssh-agent >"$env")
    . "$env" >/dev/null
}

if ! agent_is_running; then
    agent_load_env
fi

# if your keys are not stored in ~/.ssh/id_rsa.pub or ~/.ssh/id_dsa.pub, you'll need
# to paste the proper path after ssh-add
if ! agent_is_running; then
    agent_start
    ssh-add ~/.ssh/github_rsa
elif ! agent_has_keys; then
    ssh-add ~/.ssh/github_rsa
fi

unset env
