# dotfiles

Simple setup with a Git bare repository.

Inspiration
- [An elegant way to manage dotfiles using a Git bare repository](https://www.atlassian.com/git/tutorials/dotfiles)
- [Unofficial guide to dotfiles](https://dotfiles.github.io)
- [dotfiles manager comparison table](https://www.chezmoi.io/comparison-table/)
- [thoughtbot dotfiles](https://github.com/thoughtbot/dotfiles)

## First setup

```bash
git init --bare $HOME/dotfiles
echo "alias config='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'" >> $HOME/.zshrc
config config --local status.showUntrackedFiles no
```

## Usage

```bash
config status
config add .vimrc
config commit -m "Add vimrc"
config add .zshrc
config commit -m "Add zshrc"
config push
```

## Install onto a new system

```bash
git clone --bare https://github.com/<username>/dotfiles.git "$HOME/dotfiles"
function config {
   /usr/bin/git --git-dir="$HOME/dotfiles" --work-tree="$HOME" "$@"
}

mkdir -p "$HOME/dotfiles-backup"

if config checkout 2>/dev/null; then
  echo "Checked out config."
else
  echo "Backing up pre-existing dot files."

  config checkout 2>&1 | grep -E "^\s+\." | awk '{print $1}' | while read -r file; do
    mv "$HOME/$file" "$HOME/dotfiles-backup/$file"
  done

  config checkout
fi

config config --local status.showUntrackedFiles no
```


