#!/usr/bin/env bash

if [[ -e $HOME/.spacemacs ]]; then
    mv $HOME/.spacemacs $HOME/.spacemacs-old
    cp spacemacs/spacemacs $HOME/.spacemacs
    date > $HOME/.spacemacs-lid
    diff $HOME/.spacemacs $HOME/.spacemacs-old >> $HOME/.spacemacs-lid
fi

if [[ -e $HOME/.gitignore_global ]]; then
    mv $HOME/.gitignore_global $HOME/.gitignore_global-old
    cp git/gitignore_global $HOME/.gitignore_global
    date > $HOME/.gitignore_global-lid
    diff $HOME/.gitignore_global $HOME/.gitignore_global-old >> $HOME/.gitignore_global-lid
fi

