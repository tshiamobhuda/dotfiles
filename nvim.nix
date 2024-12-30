{ config, pkgs, lib, ... }:

{
  home.packages = [
    # Nix LSP
    pkgs.nixd

    # PHP
    pkgs.php82
    pkgs.php82Packages.composer
    pkgs.phpactor

    # Node
    pkgs.nodejs_20
  ];

  home.file = {
    # Neovim config using Lazyvim distro
    "./.config/nvim/".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/home-manager/nvim-kickstart";
  };

  programs.vim.enable = true;

  # Neovim
  programs = { 
    neovim = {
      enable = true;
      defaultEditor = true;
      withNodeJs = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
    };
    fd.enable = true;
    ripgrep.enable = true;
  };
}

