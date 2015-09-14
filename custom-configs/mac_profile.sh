alias youtube-audio='youtube-dl --extract-audio --audio-format mp3'

#source ~/ENV/bin/activate
export OPENNI2_INCLUDE=/usr/local/include/ni2
export OPENNI2_REDIST=/usr/local/lib/ni2
export OPENNI2_INCLUDE_DIRS=/usr/local/include/
export OPENNI2_LIBRARY=/usr/local/lib/


export VIDTIMIT=$HOME/Copy/python/data/vidtimit
export PYTHONPATH=$VIDTIMIT/code:$PYTHONPATH
export PYTHONPATH=$HOME/Copy/python/dpcn:$PYTHONPATH
export PYTHONPATH=$HOME/Copy/python/GroundHog/:$PYTHONPATH
export PYTHONPATH=$HOME/pylearn2:$HOME/Copy/python/rnn_playground:$HOME/Copy/python/utils:$HOME/Copy/python/theano-hf:$HOME/Copy/python:$HOME/Copy/python/breze:/Users/eder/Copy/python/decaf-release:$HOME/Copy/python/top:$PYTHONPATH
export PYLEARN2_DATA_PATH='/Users/eder/Copy/python/data'
export PATH=$PATH:$HOME/pylearn2/pylearn2/scripts:$HOME/Copy/python/jobman/bin
export PYLEARN2_VIEWER_COMMAND="open"
export DATA_SERVER="/home/esantana/scratch/DeepLearningTutorials"
export SERVER_NAME="esantana@hipergator.rc.ufl.edu"
export OMP_NUM_THREADS=4
export LINUX='10.227.119.29'
export GPU='10.227.119.105'
export AUSTIN='ece-n241-cnelx1.ad.ufl.edu'
export RAKESH='ece-n241-cnelx2.ad.ufl.edu'
export OBJR='eder@10.227.119.105:/home/eder/Copy/python/sandbox/objr'
export COPY='/Users/eder/Copy/python/'

export eders='eders@$GPU'

#######
# alias
#######
alias buns='source ~/anaconda/bin/activate ~/anaconda'
alias pypath='echo "export PYTHONPATH=$PWD:\$PYTHONPATH">>~/.profile'
alias gotoaustin='ssh -X edersantana@$AUSTIN'
alias inote='ipython notebook'
alias macvim='/usr/local/Cellar/macvim/7.4-77/MacVim.app'
# Your previous /Users/eder/.profile file was backed up as /Users/eder/.profile.macports-saved_2014-05-04_at_16:55:26
##

# MacPorts Installer addition on 2014-05-04_at_16:55:26: adding an appropriate PATH variable for use with MacPorts.
# export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


##
# Your previous /Users/eder/.profile file was backed up as /Users/eder/.profile.macports-saved_2014-05-04_at_16:58:17
##

# MacPorts Installer addition on 2014-05-04_at_16:58:17: adding an appropriate PATH variable for use with MacPorts.
# export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

rpython () {
    cat $1 | ssh eders@$GPU source /home/eders/newenv/bin/activate \; python -
}

veders () {
    vim scp://eders@$GPU//home/eders/$1
}

# export PS1=$PS1'\n>> '
PATH=/Users/eder/bash:$PATH
export PYTHONPATH=/Users/eder/python:$PYTHONPATH
export PYTHONPATH=/Users/eder/python/vpcn:$PYTHONPATH
export PYTHONPATH=/Users/eder/python:$PYTHONPATH

# Node
export NODE_PATH=/usr/local/lib/node_modules
