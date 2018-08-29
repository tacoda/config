#!/usr/bin/env bash

cp ../git/gitignore-global ~/.gitignore-global
git config --global core.excludesfile ~/.gitignore-global
