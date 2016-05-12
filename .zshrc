# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

source ~/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundles << EOBUNDLES

git
git-extras

history-substring-search
zsh-users/zsh-syntax-highlighting

EOBUNDLES

antigen apply

COMPLETION_WAITING_DOTS="true"

bindkey -v

#################    OSX      ##################
#
#

if [[ `uname` == 'Darwin' ]]
then
  export EDITOR='nvim'
  alias vim="nvim"
  alias vi="nvim"
  export PATH="/usr/local/bin:$PATH"
  antigen theme agnoster
  antigen apply
fi

#################    Linux     ##################
#
#
if [[ `uname` == 'Linux' ]]
then
  export PATH="/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/chris/bin:$PATH"

  export EDITOR='nvim'
  alias vim="nvim"
  alias vi="nvim"

  if [[ "$TERM" == "xterm" ]]
  then
    export TERM="xterm-256color"
  fi

  alias gvim="gvim 2>/dev/null"

  alias lock="gnome-screensaver-command -l"

  #This is a pain in linux, make it easy if you aren't in the right keyboard
  alias aoeu="key_swap ~/.qwerty | xmodmap -"
  alias asdf="key_swap ~/.dvorak | xmodmap -"

  antigen theme agnoster
  antigen apply
fi


#############     Windows/Cygwin  ####################
#

if [[ `uname` == "CYGWIN_NT-6.1" ]] || [[ `uname` == "CYGWIN_NT-6.1-WOW" ]] 
then
  # There's no clear command in cygwin for some reason
  alias clear='printf "\033c"' 
  antigen theme af-magic
  antigen apply

fi


alias cd..="cd .."

alias tmux="tmux -2"


#So if I put something in the background I can close the shell without killing
#it
setopt NO_HUP
setopt NO_CHECK_JOBS


alias -g G="| grep -i"

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

agent_load_keys(){
  for key in ~/.ssh/*rsa; do
    ssh-add "$key"
  done
}

if ! agent_is_running; then
    agent_load_env
fi

# if your keys are not stored in ~/.ssh/id_rsa.pub or ~/.ssh/id_dsa.pub, you'll need
# to paste the proper path after ssh-add
if ! agent_is_running; then
  agent_start
fi

if ! agent_has_keys; then
  agent_load_keys
fi

unset env
