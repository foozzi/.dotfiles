# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

setopt HIST_IGNORE_SPACE

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git python tmux genpass web-search zsh-syntax-highlighting zsh-autosuggestions)

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

commit_date=$(date +%Y%m%d)

source $ZSH/oh-my-zsh.sh
# functions
### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

diary ()
{
  if [[ ! -v "$1" ]]; then
    arg1=1
  else
    arg1="$1"
  fi

  if [[ "$2" == "md" ]]; then
    jrnl -n "$arg1" | glow
  else
    jrnl -n "$arg1"
  fi
}


# aliases
## tmux
alias tsc='tmux switch-client -t'
alias tsd='tmux new-session -d -s'
alias txrd='tmux source-file ~/.tmux.conf'
## default command
alias cat='bat --paging=never --theme=Dracula'
alias ls="eza"
alias la="eza -lagh --git --header"
alias lt="eza -T --git-ignore"
#alias nano='micro'
## files/dirs
alias zshe='vim ~/.zshrc'
alias zshs='. ~/.zshrc'
## neomutt
alias nm='neomutt'
## vim
# alias ovim='vim' # original vim
# alias diary='ovim ~/vimwiki/diary/diary.asc.md'
## nvim
alias evim='nvim ~/.dotfiles/global/.config/nvim/'
alias kvim='nvim ~/PKM/'
alias cvim='nvim ~/.zshrc'
alias tvim='nvim ~/Dropbox/TODO/'
alias kvimr='nvim ~/PKM/05\ -\ resources/'
alias kvimj='nvim ~/PKM/02\ -\ journal/'
alias jvim='nvim ~/PKM/02\ -\ journal/$(date "+%Y-%m-%d").md'
# alias vim='nvim'
alias vi='nvim'
alias v='nvim'
## string
alias gen8='LC_CTYPE=C tr -dc 'A-Za-z0-9' < /dev/urandom | head -c 8 | pbcopy'
## wttr.in
alias wr='curl wttr.in'
## python
alias python='python3'
alias py='python'
## todo.txt
alias todo="todo.sh -d ~/Dropbox/TODO/todo.cfg"
## eton
alias et="eton"
alias zk="eton zk"
alias di=" eton diary"
## toipe (https://github.com/Samyak2/toipe)
alias to="toipe -f ~/Productivity/TextSync/typing_wordlists/most_problems"
## jrnl.sh
alias jrnl=" jrnl"
alias lj="jrnl -n 3 --format json | jq '.entries[].date'"
## jupyter
alias jup="jupyter lab"
## hledger
alias hledger='hledger -f ~/PKM/ledger/2024.journal'
alias ehledger='nvim ~/PKM/ledger/2024.journal'
## other
alias cclear="reset && tmux clear-history && cd"
## git
alias s_diary="cd ~/PKM/diary/ && git commit -am '$commit_date' && git push origin master"
alias s_ledger="cd ~/PKM/ledger/ && git commit -am '$commit_date' && git push origin master"

# Preferred editor for local and remote sessions
export EDITOR='nvim'

# bindkeys
## autosuggest
bindkey "^]" autosuggest-accept

# envs
export DISABLE_AUTO_TITLE='true'
## fzf dracula theme
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=dark
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7'

# paths
## rust
if [[ -e "$HOME/.cargo/env" ]]; then
  source $HOME/.cargo/env
fi
## all from local/bin
export PATH=$PATH:$HOME/.local/bin
## pdtm
export PATH=$PATH:$HOME/.pdtm/go/bin
## doom emacs
export PATH=$PATH:$HOME/.config/emacs/bin
## golang
export GOPATH=$HOME/go # don't forget to change your path correctly!
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin
## cargo
export PATH=$PATH:$HOME/.cargo/bin
## color
export TERM=tmux-256color
## default gui browser
# export BROWSER="firefox"
## hledger
# export LEDGER_FILE=~/PKM/ledger/2024.journal

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

source $HOME/.zshrc-additional
source $HOME/.zshrc-secrets
