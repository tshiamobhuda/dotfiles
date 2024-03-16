# My dotfiles using Nix and Home-Manager

The home for my dotfiles & most common programs i can't live without

## Setup

1. Install Nix

run following command: `curl -L https://nixos.org/nix/install | sh`
then `[ -f "$HOME/.config/nix/nix.conf" ] || echo "experimental-features = nix-command flakes" > $HOME/.config/nix/nix.conf` to turn on nix flakes

2. clone repo `git@github.com:tshiamobhuda/dotfiles.git`
3. Run following command `nix run home-manager/master -- init --switch`

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

