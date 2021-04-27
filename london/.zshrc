# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/gsimmer/.oh-my-zsh"

ZSH_THEME="frisk"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

plugins=(git fzf zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export GOPATH="/home/gsimmer/Projects/go"
export PATH="/home/gsimmer/.local/bin:$GOPATH/bin:$PATH"

# Starship init.
#eval "$(starship init zsh)"

# aliases for various Rust-based utils.
if [ $(which exa) != 'exa not found' ]; then
   alias ls=exa
fi
if [ $(which bat) != 'bat not found' ]; then
   alias cat=bat
fi
if [ $(which rg) != 'rg not found' ]; then
   alias grep=rg
fi
source /usr/share/nvm/init-nvm.sh
eval "$(pyenv init -)"
