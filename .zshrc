# for timing stuff
# zmodload zsh/zprof

################################################################################
################################################################################
# PREREQUISITES
# - nvim - exa - skim - git - pyenv - nvm - zsh-autosuggestions
# - zsh-syntax-highlighting - starship - fzf
################################################################################
################################################################################

# Editor for local & remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

################################################################################
### KEY-BINDINGS
################################################################################

bindkey -r "^p"
bindkey -s "^p" "cd_proj_with_fzf\n"
bindkey -s "^f" "cd_home_with_fzf\n"

################################################################################
### ALIASES
################################################################################

alias ls=exa
alias skim='/Applications/Skim.app/Contents/MacOS/Skim'
alias attach='attach_tmux_with_fzf'
alias fcd='cd $(fd -t d -d 5 | fzf)'

################################################################################
### CODING ENVIRONMENTS
################################################################################

# Setup needed for pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

################################################################################
### FUNCTIONS
################################################################################
cd_home_with_fzf() {
    local dir=$(fd -t d --base-directory "$HOME" | fzf --layout=reverse \
        --preview="tree -L 1 {}" --bind="space:toggle-preview" \
        --preview-window=:hidden)

    if [ -z "$dir" ]; then
        return
    fi

    cd $HOME && cd "$dir" && echo "$PWD"
}

cd_proj_with_fzf() {
    local dir=$(fd -t d | fzf --layout=reverse --preview="tree -L 1 {}" \
        --bind="space:toggle-preview" --preview-window=:hidden)

    if [ -z "$dir" ]; then
        return
    fi

    cd "$dir" && echo "$PWD"
}

attach_tmux_with_fzf() {
    local session=$(tmux ls | awk -F ':' '{print $1}' | fzf )

    if [ -z "$session" ]; then
        return
    fi
    tmux attach -t $session
}

################################################################################
### PLUGINS
################################################################################

source ~/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh-autosuggestions/zsh-autosuggestions.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f $HOMEBREW_PREFIX/opt/forgit/share/forgit/forgit.plugin.zsh ] && \
    source $HOMEBREW_PREFIX/opt/forgit/share/forgit/forgit.plugin.zsh

eval "$(starship init zsh)"

# for timing stuff
# zprof
