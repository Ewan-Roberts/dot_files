
# git checkout a branch using peco
function gco {
  local branch="$( git branch | sed s/\*/\ /g | awk '{ print $1 }' | peco)"
  if [ ! -z "$branch" ] ; then
    git checkout "$branch"
  fi
}


alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias l='ls -Gp'

# History
# ref: https://unix.stackexchange.com/questions/18212/bash-history-ignoredups-and-erasedups-setting-conflict-with-common-history
export HISTSIZE=100000
export HISTFILESIZE=100000
export HISTCONTROL=ignoredups:erasedups

shopt -s histappend
shopt -s cmdhist
shopt -s lithist
