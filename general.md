# requeriments

- zsh
- oh my zsh
- fzf
- autojump
- zoxide
- aliases github repository
- install tmux
- create tmux configuration file (.tmux.conf)

## zsh plugins

- git
- autojump
- you-should-use
- zsh-autosuggestions
- zsh-syntax-highlighting
- zsh-history-substring-search
- git-extra-commands
- history
- web-search
- sudo
- copypath
- copyfile
- copybuffer
- jsontools
- k
- z

## import aliases into zsh

- source /home/bryant/Documents/github/dotfiles/aliases/.aliases

## import zoxide config into zsh

- eval "$(zoxide init zsh)"

## import key-bindings into zsh

- source /usr/share/doc/fzf/examples/key-bindings.zsh
- source /usr/share/doc/fzf/examples/completion.zsh

## set vim as default text editor

- sudo update-alternatives --config x-terminal-emulator

## set alacritty as a default terminal emulator

- sudo update-alternatives --install /usr/bin/x-terminal-emulator
  x-terminal-emulator /usr/bin/alacritty
- sudo update-alternatives --config x-terminal-emulator

## import the fuck into zsh

- eval $(thefuck --alias)
- eval $(thefuck --alias fk)

## add vim as a default text editor for git

- export VISUAL=nvim
- export EDITOR="$nvim"
- git config --global core.editor "nvim"
- export GIT_EDITOR=nvim
