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

DEV_DIR="$HOME/Dev"
alias devdir="cd $DEV_DIR"
alias dd="devdir"

# Lang

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Python venv alias

venv() {
    local env_name="$1"
    if [[ ! -d "$DEV_DIR/.python_envs/" ]]; then
        echo "Create folder to store envs"
        mkdir -p "$DEV_DIR/.python_envs/"
    fi
    if [[ -z $env_name ]]; then
        echo "You should provide an env name"
    else
        virtualenv --python=python3 "$DEV_DIR/.python_envs/$env_name"
    fi
}

aenv() {
    local env_name="$1"
    local env_folder="$DEV_DIR/.python_envs/$1"
    if [[ -d "$env_folder" ]]; then
        source "$env_folder/bin/activate"
    else
        echo "Env do not exists. Run venv `$env_name` to create it."
    fi
}

rmenv() {
    local env_name="$1"
    local env_folder="$DEV_DIR/.python_envs/$1"
    if [[ -d "$env_folder" ]]; then
        if [[ -z $env_name ]]; then
            echo "You should provide an env name"
        else
            rm -rf "$env_folder"
        fi
    else
        echo "Skipping. Env do not exists"
    fi
}


# Docker alias
alias dkcleani="docker rmi $(docker images -q)"
alias dkclean="docker rm -f $(docker ps -a -q)"
alias dkcleana="dkclean && dkcleani"
alias dkcleanf="docker rm $(docker ps -q -f 'status=exited') && docker rmi $(docker images -q -f 'dangling=true')"

# Utils

DATE=`date +%Y-%m-%d`
alias copy="pbcopy <"

# VI mode

set -o vi
