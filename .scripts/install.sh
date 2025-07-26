#!/usr/bin/env bash
set -euo pipefail

WITH_EXTRA=false

for arg in "$@"; do
  case $arg in
    --with-extra)
      WITH_EXTRA=true
      ;;
  esac
done

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR/.."

clone_or_pull() {
  local repo_url=$1
  local dest_dir=$2

  [ -d "$dest_dir/.git" ] && git -C "$dest_dir" pull || git clone "$repo_url" "$dest_dir"
}

case $OSTYPE in
darwin*)
  command -v brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew update
  
  brew tap | grep --fixed-strings --ignore-case --quiet "^FelixKratz/formulae\$" || brew tap FelixKratz/formulae

  brew install \
    zsh git tmux wget ripgrep fzf fd bat git-delta btop jq yq \
    gh xh shellcheck tlrc \
    rbenv nodenv temurin@21 mise \
    borders

  for cask in kitty nikitabobko/tap/aerospace; do
    brew list --cask "$cask" &>/dev/null || brew install --cask "$cask"
  done

  if [ "$WITH_EXTRA" = true ]; then
    brew install eza zoxide \
      viddy scc k6 daveshanley/vacuum/vacuum sqlfluff fastfetch git-standup

    command -v rustc >/dev/null 2>&1 || curl https://sh.rustup.rs -sSf | sh -s -- -y
    mise use -g cargo:dedoc
  fi
  ;;
esac

[ -d "$HOME/.oh-my-zsh" ] || sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
[ -f "$HOME/.oh-my-zsh/tools/upgrade.sh" ] && bash "$HOME/.oh-my-zsh/tools/upgrade.sh"

ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}

clone_or_pull https://github.com/MichaelAquilina/zsh-you-should-use.git "$ZSH_CUSTOM/plugins/you-should-use"
clone_or_pull https://github.com/zsh-users/zsh-history-substring-search.git "$ZSH_CUSTOM/plugins/zsh-history-substring-search"
clone_or_pull https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
clone_or_pull https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

PLUGIN_LINE='plugins=(git fzf docker docker-compose aws you-should-use colored-man-pages zsh-history-substring-search zsh-autosuggestions zsh-syntax-highlighting)'
if ! grep --fixed-strings --quiet "$PLUGIN_LINE" ~/.zshrc; then
  sed --in-place='.bak' "s/^plugins=.*/$PLUGIN_LINE/" ~/.zshrc
fi
