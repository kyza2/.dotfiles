export TERM="xterm-256color"

export LC_ALL=en_US.UTF-8

export EDITOR=nvim

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}

setopt PROMPT_SUBST

PS1='%F{green}[%n@%m %/]%F{248} $ '

RPROMPT='$(parse_git_branch)'

RUST_BACKTRACE=1

alias g="lazygit"

alias ls="lsd"
alias la="lsd -a"
alias lt="ls --tree"

alias feh="feh --bg-fill"

alias ..="cd .."

alias .nv="cd ~/.config/nvim/"
alias .e="cd ~/.config/emacs/"
alias .gn="cd ~/.config/goneovim/"

alias gn="~/goneovim/goneovim -u ~/.config/goneovim/nvim/init.lua"
alias nv="nvim"

alias icat="kitty +kitten icat"

source /usr/share/nvm/init-nvm.sh
