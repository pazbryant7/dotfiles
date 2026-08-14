case $- in
*i*) ;;
*) return ;;
esac

BASH_CONFIG_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.bash" && pwd -P)" || return
SHELL_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/shell"
source "$SHELL_CONFIG_DIR/load" || return

load "$SHELL_CONFIG_DIR/functions"
load "$BASH_CONFIG_DIR/functions"
load "$SHELL_CONFIG_DIR/aliases"
load "$BASH_CONFIG_DIR/aliases"
load "$BASH_CONFIG_DIR/path"
load "$BASH_CONFIG_DIR/config"
