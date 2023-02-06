# Config

> A repository for dot files, configurations and setup tools

## Make Targets

**deps** - Install dependencies

```sh
$ make deps
```

**install** - Install configurations

```sh
$ make install
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
