# Oh My ZSH begin
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""

# Just remind me to update when it's time
zstyle ':omz:update' mode disabled
#zstyle ':omz:update' frequency 14

# Command execution timestamp format in the history command output.
HIST_STAMPS="%Y-%m-%d %T"

plugins=(git fzf docker docker-compose aws you-should-use colored-man-pages zsh-history-substring-search zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
# Oh My ZSH end

# Theme sindresorhus/pure
fpath+="$HOMEBREW_PREFIX/share/zsh/site-functions"
autoload -U promptinit; promptinit
prompt pure

# Aliases
alias be='bundle exec'
alias brew-deps="brew uses --recursive --installed"
alias config='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME' 
alias cspaste="pbpaste | tr '\n' ',' | sed 's/,$//g'"
alias gbch="gbump && echo 'Starting to watch PR checks in 10s' && sleep 10 && ghch"
alias gbump="git commit -m 'Bump' --allow-empty && git push"
alias ghch="gh pr checks --watch"
alias ghchi='nohup ~/.scripts/notification-github-pr-checks.sh > /dev/null 2>&1 &'
alias grp='git rev-parse HEAD'
alias grpcp='git rev-parse HEAD | xargs echo -n | pbcopy'
alias http='xh'
alias itmux='tmux -CC'

# ENV
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALL_UPGRADE=1
export TLDR_AUTO_UPDATE_DISABLE=1

# Functions
timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

alookup() {
  alias | grep "$*"
}

