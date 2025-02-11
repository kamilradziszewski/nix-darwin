{
  nixpkgs,
  username,
  ...
}: let
  pkgs = nixpkgs.pkgs;
in {
  home-manager = {
    home.stateVersion = "25.05";
    useGlobalPkgs = true;

    users.${username} = {pkgs, ...}: {
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
  };
}
