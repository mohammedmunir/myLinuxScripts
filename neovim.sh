#!/bin/bash
#Build prerequisites
sudo apt install ninja-build gettext cmake unzip curl
# remove old version of Neovi

# clone
git clone https://github.com/neovim/neovim
cd neovim
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo
cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb

# Retrieve https://github.com/junegunn/vim-plug
#sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
#       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

#cp -r ./resources/nvim ~/.config/

# backup config file

mv ~/.config/nvim ~/.config/nvim.bak

#clone lazyvim
git clone https://github.com/LazyVim/starter ~/.config/nvim

#remove git folder so we can copy to own git
rm -rf ~/.config/nvim/.git

nvim
