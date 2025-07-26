## Paths
if [ "$(uname -m)" = "arm64" ]; then
    HOMEBREW_PREFIX="/opt/homebrew"
else
    HOMEBREW_PREFIX="/usr/local"
fi

eval "$($HOMEBREW_PREFIX/bin/brew shellenv)"
export PATH="$HOMEBREW_PREFIX/bin:$PATH" 

eval "$(nodenv init - zsh)"
eval "$(rbenv init - zsh)"
# export PYENV_ROOT="$HOME/.pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

export PATH="$HOMEBREW_PREFIX/opt/mysql@8.4/bin:$PATH"
#export PATH="$HOMEBREW_PREFIX/opt/openjdk@21/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
export PATH="$PATH:/Users/den/Library/Application Support/JetBrains/Toolbox/scripts"
export PATH="$HOME/.jbang/bin:$PATH"
export PATH="$HOME/.local/share/mise/installs/cargo-dedoc/0.2.8/bin:$PATH"

## Tmux
[[ $TMUX = "" ]] && export TERM="xterm-256color"

## Locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

