################################################################################
################################################################################
# PREREQUISITES
# - nvim - exa - skim - git - pyenv - nvm - zsh-autosuggestions
# - zsh-syntax-highlighting - starship
################################################################################
################################################################################

# Editor for local & remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

################################################################################
### ALIASES
################################################################################
alias ls=exa
alias skim='/Applications/Skim.app/Contents/MacOS/Skim'
alias gitls='git ls-tree --full-tree --name-only -r HEAD'

################################################################################
### CODING ENVIRONMENTS
################################################################################
# Setup needed for pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Setup needed for nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

################################################################################
### PLUGINS
################################################################################
source ~/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(starship init zsh)"
