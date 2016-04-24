if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

if [ $(uname) == "Darwin" ]; then
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
  fi
fi

eval "$(rbenv init -)"
