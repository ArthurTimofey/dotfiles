export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="spaceship"

source $HOME/.dotfiles/zsh/.zshrc.aliases
source $HOME/.dotfiles/zsh/.zshrc.exports

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
export PATH=/opt/homebrew/bin:$PATH

# pnpm
export PNPM_HOME="/Users/$USER/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
