# ~/.bashrc: executed by bash(1) for non-login shells.

# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
# PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
# umask 022

PS1='`[ "$?" == "0" ] && echo "\[\e[32m\]>>\[\e[m\]" || echo "\[\e[31m\]>>\[\e[m\]"` `[ "$(id -u)" == "0" ] && echo "\[\e[31m\]\u\[\e[m\]\[\e[31m\]@\[\e[m\]\[\e[31m\]\h\[\e[m\]" || echo "\[\e[32m\]\u\[\e[m\]\[\e[32m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]"` \[\e[33m\]\w\[\e[m\]\n`[ "$(id -u)" == "0" ] && echo "\[\e[32m\]#\[\e[m\]" || echo "\[\e[32m\]\\$\[\e[m\]"` '

# enable color support of ls and also add handy aliases
if [ $SHELL = "/bin/bash" -a -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    export LS_OPTIONS='--color=auto --group-directories-first'
    alias ls='ls $LS_OPTIONS'
    alias ll='ls $LS_OPTIONS -l'
    alias l='ls $LS_OPTIONS -la'
fi

# Some more alias to avoid making mistakes:
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'
alias ..="cd .."
