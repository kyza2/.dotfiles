export TERM="xterm-256color"

export LC_ALL=en_US.UTF-8

export EDITOR=nvim

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}

setopt PROMPT_SUBST

PS1='%F{green}[%n@%m %/]%F{248} $ '

RPROMPT='$(parse_git_branch)'

alias ls="lsd"
alias la="lsd -a"
alias lt="ls --tree"

alias ..="cd .."

alias .nv="cd ~/.config/nvim/"

