#!/bin/bash

platform=$(uname)
echo "On $platform"
cd $(dirname $(pwd)/${0})

echo ""
echo "For common files ..."
for fn in $(find . -maxdepth 1 -type f)
do
    if [[ ${fn} != *.cygwin && ${fn} != *.linux && ${fn} != *.sh ]]
    then
        fn=${fn##./}
        echo "ln -fs `pwd`/${fn}  ~/.${fn}"
        ln -fs `pwd`/${fn}  ~/.${fn}
    fi
done

echo ""
echo "For files in ~/.config ..."
for fn in $(find ./config -type f)
do
    fn=${fn##./}
    echo "ln -fs `pwd`/${fn}  ~/.${fn}"
    ln -fs `pwd`/${fn}  ~/.${fn}
done

echo ""
echo "For files in ~/.pip ..."
for fn in $(find ./pip -type f)
do
    fn=${fn##./}
    echo "ln -fs `pwd`/${fn}  ~/.${fn}"
    ln -fs `pwd`/${fn}  ~/.${fn}
done

echo ""
echo "For specific platform ($platform) ..."
case $platform in
    CYGWIN*)
        for fn in $(find . -maxdepth 1 -type f -name "*.cygwin")
        do
            fn="${fn##./}"
            fnn=".${fn%%.cygwin}"
            echo "ln -fs `pwd`/${fn}  ~/${fnn}"
            ln -fs `pwd`/${fn}  ~/${fnn}
        done
        ;;
    Linux)
        for fn in $(find . -maxdepth 1 -type f -name "*.linux")
        do
            fn="${fn##./}"
            fnn=".${fn%%.linux}"
            echo "ln -fs `pwd`/${fn}  ~/${fnn}"
            ln -fs `pwd`/${fn}  ~/${fnn}
        done
        ;;
    Darwin)
        # TODO
        ;;
    *)
        ;;
esac
