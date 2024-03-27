# My dotfiles using Nix and Home-Manager

The home for my dotfiles & most common programs i can't live without

## Setup

1. Install Nix
- run following command: `curl -L https://nixos.org/nix/install | sh`
- then turn on nix flakes: `[ -f "$HOME/.config/nix/nix.conf" ] || mkdir -p $HOME/.config/nix; echo "experimental-features = nix-command flakes" > $HOME/.config/nix/nix.conf`

2. clone repo: `git clone git@github.com:tshiamobhuda/dotfiles.git $HOME/.config/home-manager`
- the neovim config lives in a submodule, run `git submodule init` and `git submodule update` to pull its contents
3. Run following command `nix run . switch`

## Contents

This repo contains config for:

### Cli/Terminal

- zsh
- oh-my-zsh
- starship
- fzf
- eza
- bat
- jq
- git
- lazygit
- wezterm
- nerd font (JetBrainsMono)

### Editor

- Neovim (with LazyVim distro)
- Nixd
- php
- phpactor
- nodejs

