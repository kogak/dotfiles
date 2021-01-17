#!/bin/sh
mkdir -p ~/.config/nvim
ln -sf ~/dotfiles/init.vim ~/.config/nvim/init.vim
ln -sf ~/dotfiles/dein.toml ~/.config/nvim/dein.toml
ln -sf ~/dotfiles/dein_lazy.toml ~/.config/nvim/dein_lazy.toml
ln -sf ~/dotfiles/ftplugin ~/.config/nvim/ftplugin
ln -sf ~/dotfiles/after ~/.config/nvim/after
