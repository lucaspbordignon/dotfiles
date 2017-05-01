# Lines configured by zsh-newuser-install
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/lucasbordignon/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

###############################################################################
# Fish-like auto complete
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

PS1='%F{green}%~%f >> '

alias faustop="top"
alias cd=cdls
alias ls='ls --color=auto'
alias emacs="emacs -nw"
# Function to execute a 'cd' and, after that, a 'ls'
function cdls {
    builtin cd "$@" && ls
}

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey \^U backward-kill-line
