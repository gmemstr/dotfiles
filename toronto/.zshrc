# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/gsimmer/.oh-my-zsh"

# Not needed since we're using Starship.
# ZSH_THEME="frisk"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

plugins=(git fzf)

source $ZSH/oh-my-zsh.sh

# User configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source "$HOME/.cci-infra" 

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/bin/google-cloud-sdk/path.zsh.inc' ]; then . '/usr/bin/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/usr/bin/google-cloud-sdk/completion.zsh.inc' ]; then . '/usr/bin/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="$PATH:/home/gsimmer/flutter/bin:/home/gsimmer/scripts:/home/gsimmer/apps/goland/bin:/opt/android-sdk:/home/gsimmer/.local/bin"
export GOPATH="/home/gsimmer/Projects/go"
export DENO_INSTALL="/home/gsimmer/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# sfdx autocomplete setup
SFDX_AC_ZSH_SETUP_PATH=/home/gsimmer/.cache/sfdx/autocomplete/zsh_setup && test -f $SFDX_AC_ZSH_SETUP_PATH && source $SFDX_AC_ZSH_SETUP_PATH;

# Starship init.
eval "$(starship init zsh)"