#!/bin/bash

install_basetools() {
    BASE_TOOLS='git vim curl tmux'
    PACKAGE_MANAGER=""

    # If it's an Debian based distribution...
    if [ -f "/etc/debian_version" ]; then
        # ...install base tools via apt
        PACKAGE_MANAGER='apt install -y '
    elif [ command -v pacman &> /dev/null ]; then 
        # ...otherwise it's Arch or Manjaro, do the same with pacman
        PACKAGE_MANAGER='pacman -Syyu --noconfirm '
    fi

    sudo $PACKAGE_MANAGER $BASE_TOOLS
}

install_and_setup_env() {
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

    # Install oh-my-zsh
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    # Install powerlevel10k
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
}

install_basetools
install_and_setup_env
