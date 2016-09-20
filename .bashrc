#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Used to make xTerm with 90% of transparency.
# Need the package "transset-df"
[ -n "$XTERM_VERSION" ] && transset-df 0.90 -t --id "$WINDOWID" >/dev/null

alias faustop="top"
alias cd=cdls

# Function to execute a 'cd' and, after that, a 'ls'
function cdls {
    builtin cd "$@" && ls
}
