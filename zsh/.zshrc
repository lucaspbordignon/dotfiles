# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/lucasbordignon/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  rails
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Allows jobs to run even if the shell is killed
setopt NO_HUP

alias faustop="htop"
alias cd=cdls

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

# Work settings
export PATH=/opt/cuda/bin:${HOME}/.rbenv/bin:${PATH}
eval "$(rbenv init -)"
eval "$(pyenv init -)"

prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
      print -n "%{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
      print -n "%{%k%}"
  fi

  print -n "%{%f%}"
  CURRENT_BG=''

  #Adds the new line and ➜ as the start character.
  printf "\n ➜";
}

