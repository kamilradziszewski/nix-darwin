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

    home.sessionVariables = {
      HOMEBREW_NO_ENV_HINTS = "1";
    };

    home.packages = with pkgs; [
      alejandra
      fzf
      git
      oh-my-posh
      tmux
      zoxide
    ];

    home.file = {
      ".config/ghostty/config".source = ../dotfiles/ghostty;
    };
  };
}
