export ZSH="$HOME/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh

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

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH=/opt/homebrew/bin:$PATH

# pnpm
export PNPM_HOME="/Users/$USER/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

eval "$(starship init zsh)"
