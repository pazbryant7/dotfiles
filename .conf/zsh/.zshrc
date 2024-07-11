source ./.aliases.sh
source ./.functions.sh
source ./.zshenv
source ./.zprofile
source ./.zshconfig

# plugins
source /home/bryant/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# plugin keybind
bindkey '^N' autosuggest-accept
bindkey '^[n' forward-word

# plugin configuration
ZSH_AUTOSUGGEST_MAX_LENGTH=10
