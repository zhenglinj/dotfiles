#!/bin/bash

platform=$(uname)
case $platform in
    CYGWIN*)
        apt-cyg install python-dev python-setuptools python-pip python3-pip
        ;;
    Linux)
        apt-get install python-dev python-setuptools python-pip python3-pip
        ;;
    Darwin)
        # TODO
        ;;
    *)
        # TODO
        ;;
esac

# pip install
pip install memory_profiler
pip install psutil

# python style checker
pip install flake8
pip install pychecker
pip install pyflakes
pip install pylint
pip3 install flake8
pip3 install pychecker
pip3 install pyflakes
pip3 install pylint

# emacs auto-complete backend
pip install jedi virtualenv epc
pip install ropemacs rope ropemode
pip3 install jedi virtualenv epc
pip3 install ropemacs rope ropemode
