#!/usr/bin/env bash
echo "*** Uninstall dotfiles ***"
set -x # echo on
rm -rf $HOME/.gitconfig
rm -rf $HOME/.gitignore_global
rm -rf $HOME/.tmux.conf
rm -rf $HOME/.vimrc
rm -rf $HOME/.zshenv
rm -rf $HOME/.zshrc
rm -rf $HOME/.zshrc.d/grml.zsh
rm -rf $HOME/.ssh/config
rm -rf $HOME/.gnupg/gpg.conf
set +x # echo off
