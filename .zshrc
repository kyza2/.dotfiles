export LC_ALL=en_US.UTF-8
export EDITOR=nvim

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}

setopt PROMPT_SUBST

PS1=' %F{magenta}%/%F{white}$(parse_git_branch)
%F{green}%  -> %F{white}'

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
alias vi="vim"
alias lf='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias http="ngrok http"

alias icat="kitty +kitten icat"

# image=$(find ~/kitty_startup/ -type f | shuf -n 1)
# icat $image
