# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

plugins=(git web-search ag copyfile colored-man-pages colorize command-not-found zsh-syntax-highlighting git-auto-fetch autoenv sudo)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

alias weather="curl wttr.in/Amsterdam"

export EXA_COLORS="uu=1;34"
alias ll="exa --icons --no-user --git -lah"

alias firefox='open -a Firefox'
alias httpie='open -a HTTPie.app'
alias telegram='open -a Telegram.app'

fpath+=~/.zfunc
autoload -Uz compinit && compinit

eval "$(starship init zsh)"
eval $(thefuck --alias)

myip () {
    echo -e "\e[36mLocal IP:\e[39m    \e[1m$(ipconfig getifaddr en0)\e[21m"
    echo -e "\e[36mExternal IP:\e[39m \e[1m$(dig +short myip.opendns.com @resolver1.opendns.com)\e[21m"
}

extract () {
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xvjf $1    ;;
          *.tar.gz)    tar xvzf $1    ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       rar x $1       ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xvf $1     ;;
          *.tbz2)      tar xvjf $1    ;;
          *.tgz)       tar xvzf $1    ;;
          *.zip)       unzip $1       ;;
          *.Z)         uncompress $1  ;;
          *)           echo "don't know how to extract '$1'..." ;;
      esac
  else
      echo "'$1' is not a valid file!"
  fi
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/Downloads/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/Downloads/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc"; fi

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
