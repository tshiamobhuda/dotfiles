{ config, pkgs, lib, ... }:

{
  home.packages = [
    # Nix LSP
    pkgs.nixd
  ];

  home.file = {
    # Neovim config using Lazyvim distro
    "./.config/nvim/".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/home-manager/nvim";
  };

  programs.vim.enable = true;

  # Neovim
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withNodeJs = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };
}

