#!/bin/sh

function workon() {
    eval "cd ~/workspaces/$1"
}

function pomodori() {
    eval "cd ~/workspaces/pomodori/$1"
}

function _workdirs()
{
    local dirs
    dirs=`ls -d ~/workspaces/*/ | awk -F "/" '{printf($5)" "}'`
    COMPREPLY=($(_path_files -/ ~/workspaces ) )
}

complete -W _files -/ workon
