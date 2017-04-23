function parse_git_dirty {
  if [[ $(git stash list 2> /dev/null | tail -n1) == "stash"*"WIP"* ]]; then
    echo %{$fg_bold[yellow]%}●
  elif [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit"* ]]; then
    echo %{$fg_bold[cyan]%}✚
  else
    echo %{$fg_bold[green]%}✔
  fi
}


ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_SEPARATOR="  "
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[green]%}"

ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[yellow]%}%{●%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[yellow]%}%{✖%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[green]%}%{✚%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%}%{µ%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}%{✔%G%}"

function parse_git_branch {
#  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ $(parse_git_dirty) (\1) $(git_super_status)/"
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s@* \(.*\)@ $(git_super_status)@"
}

PROMPT='%{$fg_bold[blue]%}[%m %c]%{$reset_color%} ⚒  '
RPROMPT='$(parse_git_branch)%{$reset_color%}'
