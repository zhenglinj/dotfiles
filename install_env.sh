#!/bin/bash

platform=$(uname)
case $platform in
    CYGWIN*)
        apt-cyg install tree sdcv
        # dev tools
        apt-cyg install build-essential git cmake
        # clang
        apt-cyg install clang libclang1
        apt-cyg install emacs24
        # zsh
        apt-cyg install zsh
        ;;
    Linux)
        # for zeal, ...
        add-apt-repository ppa:zeal-developers/ppa
        apt-get update
        # zeal
        apt-get install zeal
        apt-get install tree sdcv
        # dev tools
        apt-get install build-essential git cmake
        # clang
        apt-get install clang libclang1
        apt-get install emacs24
        # zsh
        apt-get install zsh
        # markdown to pdf
        apt-get install pandoc
        # # emacs livedown
        # apt-get install nodejs npm          # livedown
        # npm install -g livedown
        ;;
    Darwin)
        # dev
        brew install git
        brew install cmake
        ;;
    *)
        # TODO
        ;;
esac

# # install Oh-my-zsh
# wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
# chsh -s /bin/zsh

# # install python env
# ./install_python_env.sh
