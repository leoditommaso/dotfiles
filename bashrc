DOTFILES_DIR="$HOME/.dotfiles"
source "$DOTFILES_DIR/bash/init.sh"
source "$DOTFILES_DIR/bash/bash_prompt"

if [ -f ~/.bashrc_local ]; then
  source ~/.bashrc_local
fi
