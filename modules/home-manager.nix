{
  nixpkgs,
  username,
  ...
}: let
  pkgs = nixpkgs.pkgs;
in {
  home-manager = {
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
      home.stateVersion = "25.05";
    };
  };
}
