# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

source .zsh-env-vars

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
# rmal mode: save
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias brow='arch --x86_64 /usr/local/Homebrew/bin/brew'
alias ib='PATH=/usr/local/bin'
alias mdocker='multipass docker --'
alias vimrc='vim ~/.vimrc'
alias zshrc='vim ~/.zshrc' 
alias xpck='yarn build && npm version prerelease -preid=develop && npm pack --pack-destination="$HOME/src-sixty/local-packages"' 
alias refresh='exec zsh'
alias sshwork="ln -sf ~/.ssh/configs/config-work ~/.ssh/config" 
alias sshhome="ln -sf ~/.ssh/configs/config-personal ~/.ssh/config"
alias gitlog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias ef2="cd ~/src/rewrite/ease-framework-v2"
alias ec="cd ~/src/rewrite/ease-core"

rtouch () {
    mkdir -p "$(dirname "$1")" && touch "$1"
}
alias rt="rtouch"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="${HOME}/.pyenv/shims:${PATH}"
export PATH="${HOME}/.pyenv/shims:${PATH}"

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# export FZF_DEFAULT_OPTS=‘—height=40% —preview=“cat {}” —preview-window=right:60%:wrap’

export WEBOS_CLI_TV="/opt/webOS_TV_SDK/CLI/bin" #LGtv
export LG_WEBOS_TV_SDK_HOME="/opt/webOS_TV_SDK" #LGtv
# enable control-s and control-q
stty start undef
stty stop undef
setopt noflowcontrol

export FZF_DEFAULT_COMMAND='ag -l --path-to-ignore ~/.ignore --nocolor --hidden -g ""'
export FZF_DEFAULT_OPTS='--preview "bat --style=numbers --color=always --line-range :500 {}"'



# bun completions
[ -s "/Users/arturs/.bun/_bun" ] && source "/Users/arturs/.bun/_bun"

# Bun
export BUN_INSTALL="/Users/arturs/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


alias userArturs="git config --global user.email "$PERSONAL_EMAIL" && git config --global user.name ArthurTimofey"
alias userSixty="git config --global user.email "$SIXTY_EMAIL" && git config --global user.name ArtursTimofejevs"
