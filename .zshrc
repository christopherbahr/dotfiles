# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

source ~/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundles << EOBUNDLES

git
git-extras

vi-mode

history-substring-search
zsh-users/zsh-syntax-highlighting

EOBUNDLES

antigen theme agnoster

antigen apply

COMPLETION_WAITING_DOTS="true"

#################    OSX      ##################
#
#
export EDITOR='nvim'

if [[ `uname` == 'Darwin' ]]
then
  export PATH="/usr/local/bin:$PATH"
fi

#################    Linux     ##################
#
#
if [[ `uname` == 'Linux' ]]
then
  export PATH="/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/chris/bin:$PATH"

  if [[ "$TERM" == "xterm" ]]
  then
    export TERM="xterm-256color"
  fi

  alias gvim="gvim 2>/dev/null"

  alias lock="gnome-screensaver-command -l"

  alias aoeu="key_swap ~/.qwerty | xmodmap -"
  alias asdf="key_swap ~/.dvorak | xmodmap -"
fi


source ~/opp/opp.zsh
source ~/opp/opp/*.zsh

alias cd..="cd .."

alias tmux="tmux -2"


#So if I put something in the background I can close the shell without killing
#it
setopt NO_HUP
setopt NO_CHECK_JOBS

SSH_ENV="$HOME/.ssh/environment"

function start_agent {
  echo "Initialising new SSH agent..."
  /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
  echo succeeded
  chmod 600 "${SSH_ENV}"
  . "${SSH_ENV}" > /dev/null
  /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
  . "${SSH_ENV}" > /dev/null
  #ps ${SSH_AGENT_PID} doesn't work under cywgin
  ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
    start_agent;
  }
else
  start_agent;
fi
