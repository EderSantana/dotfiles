# Reset Colors
Color_Off='\e[0m'            # Text Reset
Color_Off_='\[\e[0m\]'       # Text Reset

BPurple='\e[1;35m'           # Purple
BWhite='\e[1;37m'            # White

#===  FUNCTION  ================================================================
#          NAME:  trunc_pwd
#   DESCRIPTION:  Creates a truncated pwd if the pwd has a length greater than
#                 the amount of chars defined by max_pwd
#       RETURNS:  Returns nothing but creates an updated 'newPWD' variable that
#                 is used with the PROMPT_COMMAND to create a custom prompt
#===============================================================================
function trunc_pwd()
{
max_pwd=30
if [ $(echo $(pwd) | sed -e "s_${HOME}_~_" | wc -c | tr -d " ") -gt $max_pwd ]
then
  newPWD="...$(echo $(pwd) | sed -e "s_${HOME}_~_" | sed -e "s/.*\(.\{$max_pwd\}\)/\1/")"
else
  newPWD="$(echo $(pwd) | sed -e "s_${HOME}_~_")"
fi
}
PROMPT_COMMAND=trunc_pwd
PS1="$BPurple($BWhite\$newPWD$BPurple)\$ $Color_Off"

#===============================================================================
# Settings
#===============================================================================
export HISTCONTROL=ignoredups
shopt -s checkwinsize
set -o noclobber
export EDITOR=vim

#===============================================================================
#  Aliases
#===============================================================================
alias bye='sudo shutdown -h now'
alias update='sudo apt-get update && sudo apt-get upgrade'
alias upgrade='sudo apt-get upgrade'
alias clean='sudo apt-get autoclean && sudo apt-get autoremove'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ls='ls --color'
# Empty the trash folder that is created when you delete things as root
alias root_trash='sudo bash -c "exec rm -r /root/.local/share/Trash/{files,info}/*"'
alias tmux="TERM=screen-256color-bce tmux"  # Fix tmux making vim colors funky


export PYLEARN2_DATA_PATH=/home/eders/Copy/python/data
export VIDTIMIT_DATA_PATH=/home/eders/python/data/vidtimit/
alias inote='ipython notebook --ip=10.227.119.105'
alias nenv='. ~/.bashrc; . ~/newenv/bin/activate'
export AUSTIN=ece-n241-cnelx1.ad.ufl.edu
alias gotoaustin='ssh -X edersantana@$AUSTIN'

export PYTHONPATH=/home/eders/python/vpcn:$PYTHONPATH

export PYTHONPATH=/home/eders/python:/home/eders/python/data/vidtimit:/home/eders/python/pylearn2:/home/eders/python/vpcn:/home/eders/python/vpcn:
source ~/.api_ids
