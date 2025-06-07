#! /bin/bash 
###########################################
# Scripts leverage new Python Packaging Scripts
# https://packaging.python.org/en/latest/discussions/setup-py-deprecated/
###########################################

# constants
baseDir=$(cd `dirname "$0"`;pwd)
cwdDir=$PWD
export PYTHONUNBUFFERED=1
export PATH=/opt/miniconda3/envs/venv-py3/bin:$PATH
export TS=$(date +%Y%m%d%H%M%S)
export DATE=`date "+%Y%m%d"`
export DATE_WITH_TIME=`date "+%Y%m%d-%H%M%S"` #add %3N as we want millisecond too

# functions

# main 
[ -z "${BASH_SOURCE[0]}" -o "${BASH_SOURCE[0]}" = "$0" ] || return
cd $baseDir/..
rm -rf ./dist/*
python -m build --wheel

if [ $? -eq 0 ]; then
    # Install
    echo ""
    echo "Install pkg"
    ls dist/*.whl
    echo ""
    #pip install --force-reinstall dist/*.whl  # this will install all deps again
    pip install -U dist/*.whl
else
    exit $?
fi