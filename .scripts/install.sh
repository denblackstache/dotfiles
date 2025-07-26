#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(dirname "$0")"
cd "$SCRIPT_DIR/.."

case $OSTYPE in
darwin*)
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  
  yes | brew tap FelixKratz/formulae
  yes | brew install zsh git tmux wget ripgrep fzf fd bat git-delta eza zoxide btop jq yq
  yes | brew install gh xh viddy shellcheck scc tlrc k6 daveshanley/vacuum/vacuum sqlfluff fastfetch git-standup
  yes | brew install rbenv nodenv temurin@21 mise
  yes | brew install --cask kitty nikitabobko/tap/aerospace borders
  ;;
esac

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sed -i'.bak' 's/^plugins=.*$/plugins=(git fzf docker docker-compose aws you-should-use colored-man-pages zsh-history-substring-search zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc

ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}

git clone https://github.com/MichaelAquilina/zsh-you-should-use.git "$ZSH_CUSTOM/plugins/you-should-use" || \
  git -C "$ZSH_CUSTOM/plugins/you-should-use" pull

git clone https://github.com/zsh-users/zsh-history-substring-search.git "$ZSH_CUSTOM/plugins/zsh-history-substring-search" || \
  git -C "$ZSH_CUSTOM/plugins/zsh-history-substring-search" pull

git clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_CUSTOM/plugins/zsh-autosuggestions" || \
  git -C "$ZSH_CUSTOM/plugins/zsh-autosuggestions" pull

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" || \
  git -C "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" pull
