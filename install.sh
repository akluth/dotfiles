#!/bin/bash

install_basetools() {
    BASE_TOOLS='git vim curl tmux wget gcc zsh'
    PACKAGE_MANAGER=""

    # If it's an Debian based distribution...
    if [ -f "/etc/debian_version" ]; then
        # ...install base tools via apt
        PACKAGE_MANAGER='apt install -y '
    elif [ -f "/etc/fedora-release" ]; then
        # ...it's Fedora! Install eet
        PACKAGE_MANAGER='yum install -y '
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
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

    # Install powerlevel10k
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

    # Add the powerlevl10k theme to .zshrc - the cheap way
    echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> ~/.zshrc
}

install_fonts() {
    mkdir ~/.fonts
    
    wget -O ~/.fonts/MesloGSNFRegular.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
    wget -O ~/.fonts/MesloGSNFBold.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
    wget -O ~/.fonts/MesloGSNFItalic.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
    wget -O ~/.fonts/MesloGSNVBoldItalic.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

    fc-cache -f
}

install_basetools
install_and_setup_env
install_fonts
