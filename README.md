# Config

> A repository for dot files, configurations and setup tools

## Installation

**install** - Install environment

```sh
$ ./install.sh
```

## TODO

- Add doom emacs setup
- Add direnv
- Add nix makefiles
- Add other configurations

## Common Commands

> TODO: Wrap these up into scripts. This area also serves as reference.

Project tasks are wrapped up in Makefiles.

Common tasks are wrapped up in Bash scripts.

NOTE: This section uses dependencies and configurations from this repo.

**Start multiplexer**

```sh
zellij
```

**Edit file from fuzzy find**

```sh
kak $(fzf)
```

**Search for 'emacs'**

```sh
rg emacs .
```

**Replace 'emacs' with 'vim'**

```sh
sd emacs vim
```

**Find files with names containing 'init'**

```sh
fd init
```

```sh
tokei .
asdf
grex
procs
git-delta
jq
yq
xsv
hyperfine
watchexec
nushell
zoxide
bandwhich
ytop
just #?
```

## Practical Use-cases

**Run rails model spec when model app code changes**

```sh
watchexec -w app/models rspec spec/models
watchexec -w app/models -- make test dir=models
```

TODO: Makefiles >> Standard tools

TODO: Justfiles >> Custom tools

TODO: Scripts >> Custom tools


## Contents

**`bin`**

Custom binaries: [List](bin/README.md)

**`util`**

Custom utility scripts: [List](util/README.md)

