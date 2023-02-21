export ZSH="$HOME/.oh-my-zsh"


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

ZSH_THEME="spaceship"
source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export PATH=/opt/homebrew/bin:$PATH

# pnpm
export PNPM_HOME="/Users/$USER/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

export GOPATH="$HOME/go"
export PATH=$PATH:$GOPATH/bin

export CARGO_HOME="$HOME/.cargo"
export PATH="$HOME/.surrealdb:$PATH"
