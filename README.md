Dotfiles
========

Everyone has its own set of dotfiles. These are mine - based on Powerline. It shows you
- the virtualenv you're working in
- the branch you're on
- the state it's in: if every change is checked in, the amount of untracked files

When starting, you'll need to add brew

	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

VIM


Powerline
See https://medium.com/@ITZDERR/how-to-install-powerline-to-pimp-your-bash-prompt-for-mac-9b82b03b1c02

# Brew install python3
# pip3 install powerline-status
# pip3 show powerline-status -> note the location of powerline.

# Copy config:
# mkdir ~/.config/powerline
# cp -r #{powerline location}/powerline/config_files/ ~/.config/powerline/

If you're an iTerm user, look at the fonts for powerline!


Git
+++
I've also added a few handy git aliases:
- incoming: list incoming changes
- outgoing: what's only in here, but on on the remote(s)
- yolo: generate a commit message :-)

