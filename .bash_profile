export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export PATH=$PATH:/Users/bart/bin
export EDITOR='subl -w'

export HISTTIMEFORMAT="%a %d/%m/%Y %H:%M:%S "
export HISTSIZE=100000
export HISTCONTROL=ignoredups
export SVN_EDITOR=/usr/local/bin/vim

# brew bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

source ~/.dotfiles/.aliases
source ~/.dotfiles/.powerline_rc
source ~/.dotfiles/.colors_rc
source ~/.dotfiles/.github
bind -f ~/.dotfiles/.inputrc

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
