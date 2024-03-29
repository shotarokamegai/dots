#!/bin/bash

CURDIR=$(cd $(dirname $0); pwd)

# add symlink
ln -sf $CURDIR/.zshrc $HOME/.zshrc
ln -sf $CURDIR/.vimrc $HOME/.vimrc
ln -sf $CURDIR/.vimrc $HOME/.nvimrc
ln -sf $CURDIR/.tmux.conf $HOME/.tmux.conf
ln -sf $CURDIR/.xvimrc $HOME/.xvimrc
ln -sf $CURDIR/.vim $HOME/.xvim
ln -sf $CURDIR/.ideavimrc $HOME/.ideavimrc
ln -sf $CURDIR/UltiSnips $HOME/.vim/UltiSnips
