echo "Follow the white rabbit."

#Git alias

alias gstatus="git status"
alias gpull="git pull"
alias gpush="git push"
alias gpusho="git push origin"
alias gpushfo="git push --force origin"
alias gco="git commit"
alias gclone="git clone"
alias gadd="git add"
alias giff="git diff"
alias gcb="git checkout -b"

#Show git branch

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\u@\h \W\[\033[1;35m\]\$(parse_git_branch)\[\033[00m\] $ "

#S3 utils

s3cat() {
    s3_path=$1

    if [[ $s3_path != "s3://"* ]]; then
        s3_path="s3://$1"
    fi

    aws s3 cp $s3_path -
}

#Dir

DEV_DIR="~/Dev/"
alias devdir="cd $DEV_DIR"

# Lang

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Python venv alias

alias venv2="virtualenv --python=python"
alias venv3="virtualenv --python=/Library/Frameworks/Python.framework/Versions/3.6/bin/python3.6"

# Docker alias
alias dkcleani="docker rmi $(docker images -q)"
alias dkclean="docker rm -f $(docker ps -a -q)"
alias dkcleana="dkclean && dkcleani"
alias dkcleanf="docker rm $(docker ps -q -f 'status=exited') && docker rmi $(docker images -q -f 'dangling=true')"

# Utils

DATE=`date +%Y-%m-%d`
alias copy="pbcopy <"
