# メモリに保存される履歴の件数
export HISTSIZE=1000
# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000
export TERM=xterm-256color

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="gallifrey"

autoload -U compinit
# compinit -u

fpath=($(brew --prefix)/share/zsh-completions $fpath)
# fpath=($(brew --prefix)/share/zsh/site-functions $fpath)

# plugins=(git aws laravel)
plugins=(git laravel)

export EDITOR=nvim

source $ZSH/oh-my-zsh.sh

#
export SASS_LIBSASS_PATH=/Users/rootcom/libsass
export PATH=/usr/local/bin:$HOME/.rbenv/bin:$HOME/bin:/$HOME/sassc/bin:/usr/local/bin:$PATH:~/.composer/vendor/bin:~/AWS-ElasticBeanstalk-CLI-2.6.3/eb/macosx/python2.7:/usr/local/lib/node_modules/casperjs/node_modules/phantomjs/lib/phantom/bin:~/.bin

# eval "$(rbenv init -)"
export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments
alias psm='pstorm'
# alias vim='open -a MacVim'
alias mvi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vi='/usr/local/bin/vim'
alias vi="nvim"
# alias vim="nvim"
# alias mk="mkdir"
#
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/.go
export GOBIN=$GOPATH/bin
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH


alias t="tig" 
stty start undef
# cdr, add-zsh-hook を有効にする
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
# cdr の設定
zstyle ':completion:*' recent-dirs-insert both
zstyle ':chpwd:*' recent-dirs-max 500
zstyle ':chpwd:*' recent-dirs-default true
zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/shell/chpwd-recent-dirs"
zstyle ':chpwd:*' recent-dirs-pushd true
#
function peco-cdr () {
    local selected_dir=$(cdr -l | awk '{ print $2 }' | peco)
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-cdr
bindkey '^o' peco-cdr

function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

function agvim () {
  ag "$@" | peco --query "$LBUFFER" | awk -F : '{print " " $1 " +" $2}' | xargs -o vi
}

alias nvim='TERM=xterm-256color /usr/local/bin/nvim'

# export DOCKER_HOST=tcp://$(boot2docker ip 2>/dev/null):2376
# export DOCKER_CERT_PATH=/Users/rootcom/.boot2docker/certs/boot2docker-vm
# export DOCKER_TLS_VERIFY=1

function ko() {
  open -a Kobito "$@"
}

alias tm='tmux'

# mysql pager
# alias mysql="mysql --page='less -S -n -i -F -X'"
#
# define hub alias
alias git=hub
# source ~/.zsh/hub.zsh_completion.sh
alias gg=github

# export PATH="$(brew --prefix homebrew/php/php56)/bin:$PATH"
#
# composer user bin
export PATH=$HOME/.composer/vendor/bin:$PATH

# xcode
# SDKROOT=$(xcrun --show-sdk-path --sdk macosx)
# alias swift="swift -sdk $SDKROOT"
# alias switc="switfc --sdk $SDKROOT"

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function vis() {
vi $(fzf)
}
###-begin-pm2-completion-###
### credits to npm for the completion file model
#
# Installation: pm2 completion >> ~/.bashrc  (or ~/.zshrc)
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if type complete &>/dev/null; then
  _pm2_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           pm2 completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _pm2_completion pm2
elif type compctl &>/dev/null; then
  _pm2_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       pm2 completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _pm2_completion + -f + pm2
fi
###-end-pm2-completion-###
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH="/Users/rootcom/.docker/machine/machines/default"
export DOCKER_MACHINE_NAME="default"
# define docker
# eval "$(docker-machine env default)"
###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

if type complete &>/dev/null; then
  _npm_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###
#
export FZF_TMUX_HEIGHT=10
export ANDROID_HOME=/usr/local/opt/android-sdk

# http://mycli.net/
# alias mysql=mycli

code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

# if (which zprof > /dev/null) ;then
#   zprof | less
# fi
