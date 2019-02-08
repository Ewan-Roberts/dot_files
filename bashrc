
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
