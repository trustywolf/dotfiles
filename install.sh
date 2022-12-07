#!/usr/bin/env bash
tmp_dir=/tmp/dotfiles

echo "*** Installing dependencies ***"

echo "*** Creating tmp_dir ***"
git clone https://github.com/trustywolf/dotfiles.git ${pkgdir}
cd ${pkgdir}

echo "*** Install dotfiles ***"
set -x # echo on
install -D -m 644 .gitconfig $HOME/.gitconfig
install -D -m 644 .gitignore_global $HOME/.gitignore_global
install -D -m 644 .tmux.conf $HOME/.tmux.conf
install -D -m 644 .vimrc $HOME/.vimrc
install -D -m 644 .zshenv $HOME/.zshenv
install -D -m 644 .zshrc $HOME/.zshrc
install -D -m 644 .zshrc.d/grml.zsh $HOME/.zshrc.d/grml.zsh
install -D -m 700 -d $HOME/.ssh
install -D -m 600 .ssh/authorized_keys $HOME/.ssh/authorized_keys
install -D -m 600 .ssh/config $HOME/.ssh/config
install -D -m 700 -d $HOME/.gnupg
install -D -m 600 .gnupg/gpg.conf $HOME/.gnupg/gpg.conf
set +x # echo off

echo "*** Cleaning up ***"
rm -r "${pkgdir}"
