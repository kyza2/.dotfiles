
export LC_ALL=en_US.UTF-8
export EDITOR=nvim

export PATH="$PATH:/home/evan/.cargo/bin"

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}

setopt PROMPT_SUBST

PS1='%F{magenta}%/%F{white}$(parse_git_branch)
%F{green}% 󰄾 %F{white}'

alias g="lazygit"

alias ls="lsd"
alias la="lsd -a"
alias lt="ls --tree"

alias feh="feh --bg-fill"

# theme() {
#    wal --theme $1
#    wal_update.sh
# }

alias theme='function() { wal --theme "$1"; wal_update.sh; }'

generate() {
   wal -i $1
   wal_update.sh
}

alias generate='function() { wal -i "$1"; wal_update.sh; }'

alias ..="cd .."

alias .nv="cd ~/.config/nvim/"

alias nv="nvim"
alias vi="vim"
alias lf='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias http="ngrok http"

alias icat="kitty +kitten icat"
