export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export PATH=$PATH:/Users/bstroeken/go/bin
export EDITOR='code'

export HISTTIMEFORMAT="%a %d/%m/%Y %H:%M:%S "
export HISTSIZE=100000
export HISTCONTROL=ignoredups
export SVN_EDITOR=/usr/local/bin/vim
export NVM_DIR="$HOME/.nvm"

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

[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
    

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/bstroeken/.sdkman"
[[ -s "/Users/bstroeken/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/bstroeken/.sdkman/bin/sdkman-init.sh"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/bstroeken/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)