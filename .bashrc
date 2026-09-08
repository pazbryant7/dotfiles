case $- in
*i*) ;;
*) return ;;
esac

root_dir="$(builtin cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)" || return
shell_dir="$root_dir/.shell"
bash_dir="$root_dir/.bash"
source "$shell_dir/load" || return

load_modules "$shell_dir" "$bash_dir" || return
