{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "cline";
  home.homeDirectory = "/Users/cline";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.stow
    pkgs.nodejs
    pkgs.deno
    pkgs.yarn-berry
    pkgs.mods
    pkgs.go
    pkgs.cargo
    pkgs.postgresql_14
    pkgs.nil
    pkgs.speedtest-rs
    pkgs.monaspace
    pkgs.gh
    pkgs.glab
    pkgs.bat
    pkgs.eza

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })

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

  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/cline/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "hx";
  };

  home.shellAliases = {
    x = "exit";
    lg = "lazygit";
    hms = "home-manager switch";
    z = "zellij";
  };

  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/go/bin"
    "$HOME/configs/scripts"
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    # enableCompletion = true;
    syntaxHighlighting.enable = true;
  };

  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      "$schema" = "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json";
      final_space = true;
      version = 2;
      blocks = [
        {
          type = "rprompt";
          overflow = "hidden";
          alignment = "right";
          segments = [
            {
              type = "executiontime";
              style = "plain";
              foreground = "light-yellow";
              background = "transparent";
              template = "{{ .FormattedMs }}";
              properties = {
                threshold = 5000;
              };
            }
          ];
          
        }
        { 
          type = "prompt";
          alignment = "left";
          segments = [
            {
              type = "path";
              style = "plain";
              foreground = "cyan";
              background = "transparent";
              properties = {
                style = "agnoster_short";
              };
              template = "{{ .Path }} ";
            }
            {
              background = "transparent";
              foreground = "#5b5f66";
              style = "plain";
              template = "{{ .HEAD }}{{if or (.Working.Changed) (.Staging.Changed)}}*{{end}} ";
              type = "git";
              properties = {
                branch_icon = "";
                fetch_status = true;
                commit_icon = "@";
              };
            }
            {
              type = "aws";
              style = "plain";
              foreground = "yellow";
              background = "transparent";
              template = "  {{.Profile}}";
            }          
          ];
        }
        {
          type = "prompt";
          alignment = "left";
          newline = true;
          segments = [
            {
              type = "text";
              style = "plain";
              foreground_templates = [
                "{{if gt .Code 0}}red{{end}}"
                "{{if eq .Code 0}}blue{{end}}"
              ];
              template = "";
            }
          ];
        }
      ];
      transient_prompt = {
        background = "transparent";
        template = " ";
        newline = true;
        foreground_templates = [
          "{{if gt .Code 0}}red{{end}}"
          "{{if eq .Code 0}}blue{{end}}"
        ];
      };
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zellij = {
    enable = true;
    # enableZshIntegration = true;
    settings = {
      theme = "cline";
      themes.cline = {
        fg = "#FFFFFF";
        bg = "#1c1b1b";
        black = "#1c1b1b";
        red = "#BF616A";
        green = "#A3BE8C";
        yellow = "#EBCB8B";
        blue = "#81A1C1";
        magenta = "#B48EAD";
        cyan = "#88C0D0";
        white = "#E5E9F0";
        orange = "#D08770";
      };
      simplified_ui = true;
      default_layout = "compact";
      pane_frames = false;
    };
  };

  programs.wezterm = {
    enable = true;

    extraConfig = ''
    local wezterm = require 'wezterm'
    local config = wezterm.config_builder()
    config.color_scheme = 'Seoul256 (Gogh)'
    config.colors = {
      background = "#1c1b1b"
    }
    config.enable_tab_bar = false
    config.font_size = 20
    config.font = wezterm.font 'JetBrainsMono Nerd Font'
    config.harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' }
    return config
    '';
  };

  programs.helix = {
    enable = true;
    defaultEditor = true;
    extraPackages = [ 
      pkgs.marksman
      pkgs.gopls
      pkgs.nodePackages.typescript-language-server
      pkgs.vscode-langservers-extracted
    ];
    settings = {
      theme = "custom";
      editor = {
        line-number = "relative";
        auto-format = true;
        bufferline = "always";
        cursor-shape.insert = "bar";
        statusline.center = ["version-control"];
        soft-wrap.enable = true;
        lsp = {
          # display-inlay-hints = true;
          display-messages = true;
        };
        file-picker.hidden = false;
      };
    };
    themes = {
      custom = {
        inherits = "base16_transparent";
        attribute = "blue";
        function = "light-blue";
        "function.method" = "light-green";
        "variable" = "white";
        "variable.other.member" = "cyan";
        string = "light-yellow";
        "string.special" = "light-green";
        comment = "green";
        "comment.modifiers" = ["italic"];
        "ui.linenr" = "white dim";
      };
    };
  };

  programs.git = {
    enable = true;
    userEmail = "acline@precisionplanting.com";
    userName = "Andrew Cline";
    extraConfig = {
      core = {
        editor = "hx";
      };
      url = {
        "ssh://git@git.2020.dev/" = {
           insteadOf = "https://git.2020.dev/";
        };
      };
    };
  };

  programs.lazygit = { 
    enable = true;
    settings = {
      disableStartupPopups = true;
    };
  };

  programs.awscli = {
    enable = true;
    settings = import ./aws_configs.nix;
  };
}
