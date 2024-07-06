#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env

brew install meson
brew install gtk4
brew install gtksourceview5 || (brew install svn && brew install gtksourceview5)
brew install desktop-file-utils
brew install pygobject3
brew install libadwaita

export GETTEXT_DIR=$(brew --prefix)/opt/gettext


meson setup build --prefix=/usr
ninja -C build
ninja -C build install
