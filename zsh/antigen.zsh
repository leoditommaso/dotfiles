source "$DOTFILES_DIR/antigen/antigen.zsh"

antigen bundles <<EOBUNDLES
  docker
  git
  olivierverdier/zsh-git-prompt
  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-history-substring-search
EOBUNDLES

antigen apply
