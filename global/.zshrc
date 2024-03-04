# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

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
alias ovim='vim' # original vim
alias diary='ovim ~/vimwiki/diary/diary.asc.md'
## nvim
alias evim='nvim ~/.dotfiles/global/.config/nvim/'
# alias vim='nvim'
alias vi='nvim'
alias v='nvim'
## wttr.in
alias wr='curl wttr.in'
## python
alias python='python3'
alias py='python'
## todo.txt
alias todo="todo.sh -d ~/Dropbox/TextSync/TODO/todo.cfg"
## eton
alias et="eton"

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

source $HOME/.zshrc-additional
source $HOME/.zshrc-secrets
