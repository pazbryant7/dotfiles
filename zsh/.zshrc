# p10k-instant-prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_THEME="powerlevel10k/powerlevel10k"

# {{{ Settings options

autoload edit-command-line
autoload -U compinit

setopt \
    auto_cd \
    auto_pushd \
    chase_links \
    complete_aliases \
    extended_glob \
    extended_history \
    hist_ignore_all_dups \
    hist_ignore_dups \
    hist_ignore_space \
    hist_reduce_blanks \
    hist_save_no_dups \
    hist_verify \
    ignore_eof \
    inc_append_history \
    list_types \
    mark_dirs \
    noclobber \
    noflowcontrol \
    path_dirs \
    prompt_percent \
    prompt_subst \
    rm_star_wait \
    share_history

# }}}

# {{{ Environment settings

umask 027

extra_path=(
    ~/.cargo/bin \
    ~/.local/bin \
    ~/.nvm \
    ~/.oh-my-zsh \
    /sbin \
    /usr/sbin \
    /usr/local/bin \
    /usr/local/sbin \

)

export PATH="${(j|:|)extra_path}:$PATH"

HISTFILE=$HOME/.zsh_history
HISTFILESIZE=65536  # search this with `grep | sort -u`
HISTSIZE=4096
SAVEHIST=4096

REPORTTIME=60

export NVM_DIR=""
export EDITOR="nvim"
export TERMINAL="kitty"
export SUDO_EDITOR=$EDITOR
export ZSH="$HOME/.oh-my-zsh/"
export BROWSER="firefox-developer"

# }}}


# {{{ Plugins configuration

plugins=(
  git
  autojump
	you-should-use
	zsh-autosuggestions
	zsh-syntax-highlighting
	zsh-history-substring-search
	git-extra-commands
	history
	web-search
	sudo
	copypath
	copyfile
	copybuffer
  k
  z
)

typeset -g POWERLEVEL9K_DIR_MAX_LENGTH=2
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#88c0d0"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

eval "$(zoxide init --cmd cd zsh)"
eval $(thefuck --alias fk)

fpath+=${ZDOTDIR:-~}/.zsh_functions # rust completions
fpath+=~/.zfunc

# }}}


# {{{ Load config files

check_and_source_files() {
    for file in "$@"; do
        if [ -f "$file" ]; then
            source "$file"
        fi
    done
}

check_and_source_files \
  ~/.p10k.zsh \
  ~/Documents/github/dotfiles/aliases/.aliases  \
  ~/.config/broot/launcher/bash/br ~/fzf_config.sh \
  ~/.fzf.zsh \
  ~/.config/envman/load.sh \
  $ZSH/oh-my-zsh.sh \
  $NVM_DIR/nvm.sh \
  $NVM_DIR/bash_completion \

# }}}
