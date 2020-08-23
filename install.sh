#!/bin/bash

WORKING_DIR=`pwd`
cd ~

# Install oh-my-tmux and custom config
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp $WORKING_DIR/tmux.conf.local ./.tmux.conf.local

# Install vim-plug and custom config
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp $WORKING_DIR/vimrc ./.vimrc
vim -c "PlugInstall"

