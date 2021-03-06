# helpers
_mac_osx() { [ $(uname) = 'Darwin' ] ;}
_linux() { [ $(uname) = 'Linux' ] ;}

dir="$DOTFILES_DIR/shell"

env_file="$dir/env"
[ -e $env_file ] && source $env_file

alias_file="$dir/alias"
[ -e $alias_file ] && source $alias_file

# load functions after alias so that they can be inherited
func_file="$dir/functions"
[ -e $func_file ] && source $func_file

path_file="$dir/path"
[ -e $path_file ] && source $path_file

# clean up after ourselves
unset dir env_file alias_file func_file path_file
