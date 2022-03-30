# ZSH Theme
fpath+=$HOME/.zsh/pure
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
alias :q=exit

# Function to execute a 'cd' and, after that, a 'ls'
function cdls {
    builtin cd "$@" && ls
}

# Allowing to use SCM_breeze path expansion
function vim {
    exec_scmb_expand_args /usr/bin/vim $@
}

function rspec {
    exec_scmb_expand_args rspec $@
}

bindkey "[C" forward-word # Option + ->
bindkey "[D" backward-word # Option + <-

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
export ANDROID_NDK_HOME="/usr/local/share/android-ndk"
export ANDROID_SDK_ROOT="/usr/local/share/android-sdk"
export ANDROID_HOME="/usr/local/share/android-sdk"
export PATH=/opt/cuda/bin:${HOME}/.rbenv/bin:${PATH}
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

eval "$(rbenv init -)"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
