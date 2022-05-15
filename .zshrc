export ZSH="/home/gsimmer/.oh-my-zsh"

ZSH_THEME="frisk"

plugins=(git fzf zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

export GOPATH="/home/gsimmer/projects/go"
export CARGOPATH="/home/gsimmer/.cargo/bin"
export PATH="/usr/local/go/bin:/home/gsimmer/.local/bin:$GOPATH/bin:$CARGOPATH:$PATH"

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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export FLYCTL_INSTALL="/home/gsimmer/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"
