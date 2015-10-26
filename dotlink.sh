#!/usr/bin/env bash

# symlink dotfiles into home folder

ln -s $HOME/dotfiles/ansiweatherrc $HOME/.ansiweatherrc
ln -s $HOME/dotfiles/bashrc $HOME/.bashrc
ln -s $HOME/dotfiles/gitignore_global $HOME/.gitignore_global
ln -s $HOME/dotfiles/latexmkrc $HOME/.latexmkrc
ln -s $HOME/dotfiles/nvimrc $HOME/.nvimrc
ln -s $HOME/dotfiles/spacemacs.d $HOME/.spacemacs.d
ln -s $HOME/dotfiles/tmux.conf $HOME/.tmux.conf
ln -s $HOME/dotfiles/zshrc $HOME/.zshrc

