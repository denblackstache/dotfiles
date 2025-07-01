#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(dirname "$0")"
cd "$SCRIPT_DIR/.."

case $OSTYPE in
darwin*)
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  yes | brew install zsh git tmux wget ripgrep fzf fd bat delta eza zoxide btop jq yq
  yes | brew install gh xh viddy shellcheck scc tlrc k6 vacuum
  yes | brew install rbenv nodenv temurin@21
  yes | brew install --cask kitty
  ;;
esac

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sed -i'.bak' 's/^plugins=.*$/plugins=(git fzf ssh-agent rbenv nodenv docker docker-compose aws you-should-use colored-man-pages)/' ~/.zshrc

YOU_SHOULD_USE_REPO=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git "$YOU_SHOULD_USE_REPO" || true
git -C "$YOU_SHOULD_USE_REPO" pull
