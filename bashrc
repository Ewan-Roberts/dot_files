
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
# delete local branches that have been merged
alias gbda='git branch --no-color --merged | command grep -vE "^(\*|\s*(master|develop|dev)\s*$)" | command xargs -n 1 git branch -d'


# History
export HISTSIZE=100000
export HISTFILESIZE=100000
export HISTCONTROL=ignoredups:erasedups

function share_history {
  history -a # Append the previous command to .bash_history
  history -c # Clear the history in memory
  history -r # Load the history from .bash_history
}

shopt -u histappend # Disable histappend as history -a does this job

# Save multi-line commands nicely
# ref: https://unix.stackexchange.com/questions/109032/how-to-get-a-history-entry-to-properly-display-on-multiple-lines
shopt -s cmdhist
shopt -s lithist

export PROMPT_COMMAND="share_history; $PROMPT_COMMAND"

shopt -s histappend
shopt -s cmdhist
shopt -s lithist

# set vim key bindings in bash
set -o vi
