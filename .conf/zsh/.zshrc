# {{{ Settings options
autoload -U compinit && compinit
autoload -U bashcompinit && bashcompinit

# zsh options

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS

extra_path=(
  $HOME/.local/share/nvim/mason/bin \
  /usr/local/bin/ \
  /var/lib/flatpak/exports/bin/ \
  ~/.cargo/bin/ \
  ~/.local/bin \
  ~/.local/share/bob/nvim-bin/ \
  ~/.zfunc/ \
  ~/go/bin/ \
) 

# extend path

export PATH="${(j|:|)extra_path}:$PATH"

# }}}

# {{{ Load config files

check_and_source_files \
  "/home/bryant/zsh/plugins" \
  "/usr/share/zsh/plugins" \

# }}}

##{{{ start binaries config

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(register-python-argcomplete pipx)"
eval "$(fnm env --use-on-cd)"
eval "$(thefuck --alias fk)"
eval "$(atuin init zsh)"
eval "$(dircolors ~/.dir_colors)"

# }}}

# {{ completions

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# }}
