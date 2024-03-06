{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "tshiamobhuda";
  home.homeDirectory = "/Users/tshiamobhuda";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';

    # Neovim config using Lazyvim distro
    "./.config/nvim/".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/home-manager/nvim";
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/tshiamobhuda/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # === MY EDITS ===

  # ZSH
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
  };

  # Git
  programs.git = {
    enable = true; # download & configure
    userName = "Tshiamo Bhuda";
    userEmail = "tshiamobhuda@gmail.com";
    extraConfig = {
        init.defaultBranch = "main";
        core.editor = "nvim";
        push.autoSetupRemote = true;
        pull.rebase = false;
      };
  };

  # Starship
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      # Prompt
      format = "[░▒▓](#a3aed2)[  ](bg:#a3aed2 fg:#090c0c)$battery[](fg:#a3aed2) $directory$all";

      # Inserts a blank line between shell prompt
      add_newline = true;

      # Bettery status plugin
      battery = {
        format = "[▓](#a3aed2)[ $symbol ]('')[ $percentage ](bg:#a3aed2 fg:#090c0c)";
        full_symbol = "󰁹";
        charging_symbol = "󱟦";
        display = [{
          threshold = 30;
          discharging_symbol = "󱟥";
        } {
          threshold = 90;
          discharging_symbol = "󱟤";
        }];
      };

      # directory plugin
      directory = {
        truncation_length = 1;
        truncate_to_repo = false;
        fish_style_pwd_dir_length = 1;
      };
    };
  };

  # Eza
  programs.eza = {
    enable = true;
    enableAliases = true;
    git = true;
    icons = true;
  };

  # Ffz
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  # JQ
  programs.jq.enable = true;

  # lazygit
  programs.lazygit.enable = true;

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
