{ pkgs, lib, ... }:

{
  # === Sourced files ===
  home = {
    file = {
      # wezterm config using lua
      "./.config/wezterm/".source = ./wezterm;
    };
  };

  # === My Programs ===
  programs = {
    # ZSH
    zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      initExtra = ''
        [[ ! $(command -v nix) && -e "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh" ]] && source "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh"
      '';
    };

    # Starship
    starship = {
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
          display = [
            {
              threshold = 30;
              discharging_symbol = "󱟥";
            }
            {
              threshold = 90;
              discharging_symbol = "󱟤";
            }
          ];
        };

        # directory plugin
        directory = {
          truncation_length = 1;
          truncate_to_repo = false;
          fish_style_pwd_dir_length = 1;
        };
      };
    };

    # Git
    git = {
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

    # lazygit
    lazygit.enable = true;

    # Eza
    eza = {
      enable = true;
      enableAliases = true;
      git = true;
      icons = true;
    };

    # Ffz
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    # JQ
    jq.enable = true;

    # Terminal
    wezterm = {
      enable = true;
      enableZshIntegration = true;
    };

  };
}
