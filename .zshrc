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
alias gitls='git ls-tree --full-tree --name-only -r HEAD'
alias gitadd='git_add_unstaged_files_with_fzf'
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

git_add_unstaged_files_with_fzf() {
    if git rev-parse --is-inside-work-tree &> /dev/null; then
        local modified_files=$(git status --porcelain | awk '/^ |MM/ {print $2}')
        local untracked_files=$(git ls-files --others --exclude-standard)
        if [ -n "$modified_files$untracked_files" ]; then
            local files_to_add=$(echo "$modified_files\n$untracked_files" | fzf \
                --layout=reverse --multi --preview="git diff {}" \
                --bind="space:toggle-preview" --preview-window=:hidden)
            if [ -n "$files_to_add" ]; then
                if git add "$files_to_add"; then
                    echo "Files to be committed:"
                    local green='\033[0;32m'
                    echo -e "${green}$(git diff --name-only --cached)"
                fi
            fi
        else
            echo "No files to add"
        fi
    else
        echo "Not in Git repo"
    fi
}

################################################################################
### PLUGINS
################################################################################

source ~/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh-autosuggestions/zsh-autosuggestions.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(starship init zsh)"

# for timing stuff
# zprof
