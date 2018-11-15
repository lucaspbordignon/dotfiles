# ZSH Theme
autoload -U promptinit; promptinit
prompt pure

# ZSH autocomplete init
autoload -U compinit
compinit

# History
HISTFILE=~/.zsh_hist
HISTSIZE=1000
SAVEHIST=1000

# Allows jobs to run even if the shell is killed
setopt NO_HUP

alias faustop="htop"
alias cd=cdls
alias ls='ls -G'
alias :q=exit

# Function to execute a 'cd' and, after that, a 'ls'
function cdls {
    builtin cd "$@" && ls
}

bindkey "[C" end-of-line # Option + ->
bindkey "[D" beginning-of-line # Option + <-
bindkey "^[a" backward-word # Cmd + <-
bindkey "^[e" forward-word # Cmd + ->

# FZF configs
# Ctrl + R -> Searches the last commands
# Ctrl + P -> Searches by filename

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='
  --color dark,hl:33,hl+:37,fg+:235,bg+:242,fg+:254
  --color info:254,prompt:37,spinner:108,pointer:235,marker:235
'
bindkey '^P' fzf-file-widget

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -s "/Users/lucasbordignon/.scm_breeze/scm_breeze.sh" ] && source "/Users/lucasbordignon/.scm_breeze/scm_breeze.sh"

# Autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Work settings
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=/opt/cuda/bin:${HOME}/.rbenv/bin:${PATH}
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

eval "$(rbenv init -)"
eval "$(pyenv init -)"
