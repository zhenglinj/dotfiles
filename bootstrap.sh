#!/bin/bash

platform=$(uname)
echo "On $platform"
cd $(dirname $(pwd)/${0})


# For ~/.* -> ~/dotfiles/*
echo ""
echo "For common files ..."
for fn in $(find . -maxdepth 1 -type f)
do
    if [[ ${fn} != *.cygwin && ${fn} != *.linux && ${fn} != *.osx && ${fn} != *.sh ]]
    then
        fn=${fn##./}
        echo "ln -fs `pwd`/${fn}  ~/.${fn}"
        ln -fs `pwd`/${fn}  ~/.${fn}
    fi
done


# For ~/.*/.* -> ~/dotfiles/*/*
echo ""
echo "For files in ~/.config ..."
if [ ! -d ~/.config ]; then
    mkdir -p ~/.config
    echo "mkdir -p ~/.config"
fi
for fn in $(find ./config -type f)
do
    fn=${fn##./}
    echo "ln -fs `pwd`/${fn}  ~/.${fn}"
    ln -fs `pwd`/${fn}  ~/.${fn}
done

echo ""
echo "For files in ~/.pip ..."
if [ ! -d ~/.pip ]; then
    mkdir -p ~/.pip
    echo "mkdir -p ~/.pip"
fi
for fn in $(find ./pip -type f)
do
    fn=${fn##./}
    echo "ln -fs `pwd`/${fn}  ~/.${fn}"
    ln -fs `pwd`/${fn}  ~/.${fn}
done

echo ""
echo "For files in ~/.plotly ..."
if [ ! -d ~/.pip ]; then
    mkdir -p ~/.pip
    echo "mkdir -p ~/.plotly"
fi
for fn in $(find ./plotly -type f)
do
    fn=${fn##./}
    echo "ln -fs `pwd`/${fn}  ~/.${fn}"
    ln -fs `pwd`/${fn}  ~/.${fn}
done


# For specific platform
echo ""
echo "For specific platform ($platform) ..."
case $platform in
    CYGWIN*)
        for fn in $(find . -maxdepth 1 -type f -name "*.cygwin.sh")
        do
            fn="${fn##./}"
            fnn=".${fn%%.cygwin.sh}"
            echo "ln -fs `pwd`/${fn}  ~/${fnn}"
            ln -fs `pwd`/${fn}  ~/${fnn}
        done
        ;;
    Linux)
        for fn in $(find . -maxdepth 1 -type f -name "*.linux.sh")
        do
            fn="${fn##./}"
            fnn=".${fn%%.linux.sh}"
            echo "ln -fs `pwd`/${fn}  ~/${fnn}"
            ln -fs `pwd`/${fn}  ~/${fnn}
        done
        ;;
    Darwin)
        for fn in $(find . -maxdepth 1 -type f -name "*.osx.sh")
        do
            fn="${fn##./}"
            fnn=".${fn%%.osx.sh}"
            echo "ln -fs `pwd`/${fn}  ~/${fnn}"
            ln -fs `pwd`/${fn}  ~/${fnn}
        done
        ;;
    *)
        ;;
esac
