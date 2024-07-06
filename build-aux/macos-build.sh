#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env

rustup target add x86_64-apple-darwin


brew install meson
brew install gtk4
brew install gtksourceview5 || (brew install svn && brew install gtksourceview5)
brew install desktop-file-utils
brew install pygobject3
brew install libadwaita

export GETTEXT_DIR=$(brew --prefix)/opt/gettext


meson setup build --prefix="/" -Dprofile=development
ninja -C build
ninja -C build install

BIN="mi_app"
BIN_PATH="build/src/${BIN}"

mkdir -p dist

cp "${BIN_PATH}" dist/

DEPENDENCIAS=$(otool -L "${BIN_PATH}" | awk '/\/usr\/local\/opt/{print $1}' | sort | uniq) 
for dep in $DEPENDENCIAS; do
    dep_basename=$(basename "$dep")
    
    cp "$dep" dist/
    
    install_name_tool -change "$dep" "@executable_path/${dep_basename}" "dist/${BIN}"
done
