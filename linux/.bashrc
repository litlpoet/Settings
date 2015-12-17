export TERM=xterm-256color
export PS1='${debian_chroot:+($debian_chroot)}\[\e[01;32m\]\u@\h\[\e[01;34m\] \w\[\e[00;31m\] $(__git_ps1 "(%s)") \n\[\e[00m\]\$ '
