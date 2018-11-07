# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
       # Shell is non-interactive.  Be done now!
       return
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

function color_my_prompt {
    local __user_and_host="\[\033[01;32m\]\u@\h"
    local __cur_location="\[\033[01;34m\]\w"
    local __git_branch_color="\[\033[31m\]"
    local __git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
    local __prompt_tail="\[\033[35m\]$"
    local __last_color="\[\033[00m\]"
    local __git_dirty='`git rev-parse 2>/dev/null && (git diff --no-ext-diff --quiet --exit-code 2> /dev/null || echo -e "* ")`'
    export PS1="$__user_and_host $__cur_location $__git_branch_color$__git_branch$__git_dirty$__prompt_tail$__last_color "
}
color_my_prompt

set -o vi
