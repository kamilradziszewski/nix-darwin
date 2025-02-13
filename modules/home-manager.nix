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
      alejandra
      bat
      fzf
      git
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
        # useTheme = "cobalt2";
        # useTheme = "M365Princess";
        # useTheme = "dracula";
        useTheme = "marcduiker";
      };
    };
  };
}
