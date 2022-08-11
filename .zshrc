export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="spaceship"

source .zsh-env-vars
source $HOME/.dotfiles/zshrc/.zshrc.aliases
source $HOME/.dotfiles/zshrc/.zshrc.exports

DISABLE_AUTO_TITLE="true"
stty start undef
stty stop undef
setopt noflowcontrol

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

rtouch () {
    mkdir -p "$(dirname "$1")" && touch "$1"
}




[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
