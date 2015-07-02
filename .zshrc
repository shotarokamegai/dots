# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="gallifrey"

# plugins=(composer)

source $ZSH/oh-my-zsh.sh
# User configuration
source /usr/local/bin/aws_zsh_completer.sh

export SASS_LIBSASS_PATH=/Users/rootcom/libsass
export PATH=$HOME/.rbenv/bin:$HOME/bin:/$HOME/sassc/bin:/usr/local/bin:$PATH:~/.composer/vendor/bin:~/AWS-ElasticBeanstalk-CLI-2.6.3/eb/macosx/python2.7:/usr/local/lib/node_modules/casperjs/node_modules/phantomjs/lib/phantom/bin

# eval "$(rbenv init -)"
export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments
alias pm='pstorm'
# alias vim='open -a MacVim'
alias vi="nvim"
alias vim="nvim"

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

# define docker
export DOCKER_HOST=tcp://$(boot2docker ip 2>/dev/null):2376
export DOCKER_CERT_PATH=/Users/rootcom/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

# mysql pager
alias mysql="mysql --page='less -S -n -i -F -X'"
#
# define hub alias
alias git=hub
# source ~/.zsh/hub.zsh_completion.sh
alias gg=github

# export PATH="$(brew --prefix homebrew/php/php56)/bin:$PATH"
#
# composer user bin
export PATH=$HOME/.composer/vendor/bin:$PATH
