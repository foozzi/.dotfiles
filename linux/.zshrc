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
alias nano='micro'
## files/dirs
alias zshe='vim ~/.zshrc'
alias zshs='. ~/.zshrc'
## neomutt
alias nm='neomutt'
## vim
alias diary='vim ~/vimwiki/diary/diary.asc.md'
## wttr.in
alias wr='curl wttr.in'
## python
alias python='python3'
alias py='python'
## Open Suse
alias zup='sudo zypper dup'
alias zin='sudo zypper in'

# Preferred editor for local and remote sessions
export EDITOR='vim'

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
source $HOME/.cargo/env
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
## color
export TERM=tmux-256color
## docker
export DOCKER_HOST=unix:///run/user/1000/docker.sock

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

