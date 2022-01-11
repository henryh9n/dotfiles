[ -z "$PS1" ] && return

#### FIG ENV VARIABLES ####
# Please make sure this block is at the start of this file.
[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh
#### END FIG ENV VARIABLES ####

#### CUSTOM FUNCTIONS ####
# Extract known archives
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

myip () {
    echo -e "\e[36mLocal IP:\e[39m    \e[1m$(ipconfig getifaddr en0)\e[21m"
    echo -e "\e[36mExternal IP:\e[39m \e[1m$(dig +short myip.opendns.com @resolver1.opendns.com)\e[21m"
}
#### END CUSTOM FUNCTIONS ####

#### ALIASES ####
#alias ll='ls -lAhF'
export EXA_COLORS="uu=1;34"
alias ll='exa -lFah --git'
alias cat='bat'
alias grep='grep --color=always -in'

alias firefox='open -a Firefox'
alias httpie='open -a HTTPie.app'
alias telegram='open -a Telegram.app'
#### END ALIASES ####

eval $(thefuck --alias)

complete -C /usr/local/bin/terraform terraform

source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh

PS1="\[\e[1;34m\]\u\[\e[m\]"
PS1+=" "
PS1+="\[\e[0m\]\W\[\e[m\]"
PS1+="\[\e[0;92m\]\$(__git_ps1)\[\e[m\]$ "

#### FIG ENV VARIABLES ####
# Please make sure this block is at the end of this file.
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####
