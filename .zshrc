# Lines configured by zsh-newuser-install
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/lucasbordignon/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

###############################################################################
# History
HISTFILE=~/.zsh_hist
HISTSIZE=1000
SAVEHIST=1000

# Allows jobs to run even if the shell is killed
setopt NO_HUP

# Fish-like auto complete
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

PS1='%F{green}%~%f >> '

alias faustop="htop"
alias cd=cdls
alias nvidia-docker=gpudocker

# Function to execute a 'cd' and, after that, a 'ls'
function cdls {
    builtin cd "$@" && ls
}

function gpudocker {
    sudo -b nohup nvidia-docker-plugin > /tmp/nvidia-docker.log && nvidia-docker
}

bindkey "[C" end-of-line # Option + ->
bindkey "[D" beginning-of-line # Option + <-
bindkey "^[a" backward-word # Cmd + <-
bindkey "^[e" forward-word # Cmd + ->


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -s "/Users/lucasbordignon/.scm_breeze/scm_breeze.sh" ] && source "/Users/lucasbordignon/.scm_breeze/scm_breeze.sh"

# Work settings
export PATH=/opt/cuda/bin:${HOME}/.rbenv/bin:${PATH}
export LD_LIBRARY_PATH=/opt/cuda/include:${PATH}
eval "$(rbenv init -)"
eval "$(pyenv init -)"
