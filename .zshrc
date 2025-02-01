# Oh My ZSH begin
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""

# just remind me to update when it's time
zstyle ':omz:update' mode reminder 
zstyle ':omz:update' frequency 14

# Command execution timestamp format in the history command output.
HIST_STAMPS="%Y-%m-%d %T"

plugins=(git)

source $ZSH/oh-my-zsh.sh
# Oh My ZSH end

# Theme sindresorhus/pure
fpath+=/opt/homebrew/share/zsh/site-functions
autoload -U promptinit; promptinit
prompt pure

# Aliases
alias awsl="aws sso login --profile"
alias be='bundle exec'
alias brew-deps="brew uses --recursive --installed"
alias config='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME' # manage dotfiles
alias cspaste="pbpaste | tr '\n' ',' | sed 's/,$//g'"
alias gbch="gbump && echo 'Starting to watch PR checks in 10s' && sleep 10 && ghch"
alias gbump="git commit -m 'Bump' --allow-empty && git push"
alias ghch="gh pr checks --watch"
alias grp='git rev-parse HEAD'
alias grpcp='git rev-parse HEAD | xargs echo -n | pbcopy'
alias http='xh'
alias itmux='tmux -CC'
alias j!=jbang
alias m4b-tool='docker run -it --rm -u $(id -u):$(id -g) -v "$(pwd)":/mnt sandreas/m4b-tool:latest'
#alias ls='ls -FG'
#alias la='ls -aFG'
#alias ll='ls -lhFG'
alias power-report="~/www/scripts/power-report"
alias power-watch="~/www/scripts/power-watch"
alias sqlint="sqlfluff lint --dialect mysql"
alias x-request-id="~/www/ambulnz/scripts/logs/x-request-id"

# ENV
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALL_UPGRADE=1
export M2_HOME="/Users/den/.local/apache-maven-3.9.3" 
export TLDR_AUTO_UPDATE_DISABLE=1

# Functions
timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

alookup() {
  alias | grep "$*"
}

