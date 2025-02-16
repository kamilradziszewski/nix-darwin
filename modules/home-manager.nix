{
  nixpkgs,
  username,
  ...
}: let
  pkgs = nixpkgs.pkgs;
in {
  home-manager.useGlobalPkgs = true;

  home-manager.users.${username} = {pkgs, ...}: {
    home.stateVersion = "25.05";

    # home.sessionVariables = {
    #   HOMEBREW_NO_ENV_HINTS = "1";
    # };

    home.packages = with pkgs; [
      bat
      fzf
      git
      nixfmt-rfc-style
      oh-my-posh
      tmux
      zoxide
    ];

    home.file = {
      ".config/ghostty/config".source = ../dotfiles/ghostty;
    };

    programs = {
      zsh = {
        plugins = [
          {
            name = "you-should-use";
            src = "${pkgs.zsh-you-should-use}/share/zsh/plugins/you-should-use";
          }
        ];

        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        shellAliases = {
          nr = "npm run ";
          ll = "ls -alh";
          cat = "bat";
        };

        oh-my-zsh = {
          enable = true;
          plugins = [
            "git"
          ];
          # theme = "robbyrussell";
          # theme = "agnoster";
        };

        # initExtra = ''
        #   export HOMEBREW_NO_ENV_HINTS=1
        # '';
      };

      oh-my-posh = {
        enable = true;
        enableZshIntegration = true;
        # useTheme = "cobalt2";
        # useTheme = "M365Princess";
        # useTheme = "dracula";
        useTheme = "marcduiker";
      };

      vscode = {
        enable = true;

        userSettings = {
          # This property will be used to generate settings.json:
          # https://code.visualstudio.com/docs/getstarted/settings#_settingsjson
          "editor.formatOnSave" = true;
          "editor.codeActionsOnSave" = {
            "source.addMissingImports" = "explicit";
            "source.organizeImports" = "explicit";
            # "source.removeUnusedImports" = "explicit";
          };

          "workbench.sideBar.location" = "right";
          "editor.minimap.enabled" = false;

          "editor.fontFamily" =
            "OperatorMono Nerd Font, JetBrainsMono Nerd Font, Menlo, Monaco, 'Courier New', monospace";
          "editor.fontLigatures" = false;
          "editor.fontSize" = 14;

          "window.zoomLevel" = 0.5;

          "diffEditor.hideUnchangedRegions.enabled" = true;
        };

        extensions = [
          pkgs.vscode-marketplace.eamodio.gitlens
          pkgs.vscode-marketplace.jnoortheen.nix-ide
        ];
      };
    };
  };
}
