export ZSH="$HOME/.oh-my-zsh"

source .zsh-env-vars
source $ZSH/oh-my-zsh.sh
source $HOME/.dotfiles/zshrc/.zshrc.aliases
source $HOME/.dotfiles/zshrc/.zshrc.exports

ZSH_THEME="spaceship"
DISABLE_AUTO_TITLE="true"
stty start undef
stty stop undef
setopt noflowcontrol

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

rtouch () {
    mkdir -p "$(dirname "$1")" && touch "$1"
}



