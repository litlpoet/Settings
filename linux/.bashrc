#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# # python related
# export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2.7
# export VIRTUALENVWRAPPER_VIRTUALENV=/usr/bin/virtualenv2
# export WORKON_HOME=~/.pyvenvs
# source /usr/bin/virtualenvwrapper.sh
# # python related end

# alias
alias ls='ls --color=auto --group-directories-first'
alias ll='ls -lh'
alias lla='ll -a'

# TERM=xterm-256color

# Simple default PS1
# \u = user
# \A = time
PS1='[\u@\h]:\w\n\$ '

# >>>>BEGIN ADDED BY CNCHI INSTALLER<<<< #
# BROWSER=/usr/bin/google-chrome-stable
# EDITOR=/usr/bin/nano
# >>>>>END ADDED BY CNCHI INSTALLER<<<<< #

