## Paths

HOMEBREW_ROOT_PATH="/usr/local" # Intel Mac
# HOMEBREW_ROOT_PATH="/opt/homebrew" # Apple ARM Mac

export PATH="$HOMEBREW_ROOT_PATH/bin:$PATH" 
# export PATH="$HOMEBREW_ROOT_PATH/bin:$PATH" 

eval "$(nodenv init - zsh)"
eval "$(rbenv init - zsh)"

## MySQL
export PATH="$HOMEBREW_ROOT_PATH/opt/mysql@8.4/bin:$PATH"

## Java 21
export PATH="$HOMEBREW_ROOT_PATH/opt/openjdk@21/bin:$PATH"

## Flyway (Legacy)
export PATH="$HOME/.local/flyway-6.4.4:$PATH"

## Maven
export PATH="$HOME/.local/apache-maven-3.9.6/bin:$PATH"

## Local Scripts
export PATH="$HOME/.local/bin:$PATH"

## rbenv shim bin
export PATH="$HOME/.rbenv/bin:$PATH"

## global ruby gems
# export PATH="~/.rbenv/versions/3.3.0/bin:$PATH"

## sublime text
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"

# Load pyenv
# ~/.zprofile (for login shells) and ~/.zshrc (for interactive shells) :
# export PYENV_ROOT="$HOME/.pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

# JetBrains Toolbox App
export PATH="$PATH:/Users/den/Library/Application Support/JetBrains/Toolbox/scripts"

# Add JBang to environment
export PATH="$HOME/.jbang/bin:$PATH"

eval "$($HOMEBREW_ROOT_PATH/bin/brew shellenv)"

# Tmux
[[ $TMUX = "" ]] && export TERM="xterm-256color"

