echo "Follow the white rabbit."

#Git alias

alias gstatus="git status"
alias gpull="git pull"
alias gpush="git push"
alias gco="git commit"
alias gclone="git clone"
alias gadd="git add"

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

#Dir

DEV_DIR="~/Dev/"
alias devdir="cd $DEV_DIR"

alias copy="pbcopy <"
