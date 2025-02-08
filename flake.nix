{
  description = "nix-darwin flake config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    darwin,
    ...
  }: let
    # replace with your own system, username, useremail, and hostname
    system = "__SYSTEM__"; # aarch64-darwin or x86_64-darwin
    username = "__USERNAME__";
    useremail = "__USEREMAIL__";
    hostname = "__HOSTNAME__";
  in {
    darwinConfigurations."${hostname}" = darwin.lib.darwinSystem {
      inherit system;
      modules = [
        {
          system.stateVersion = 6;
          nixpkgs.hostPlatform = system;
          networking.hostName = hostname;
          imports = [
            home-manager.darwinModules.home-manager
          ];

          security.pam.enableSudoTouchIdAuth = true;
          nixpkgs.config.allowUnfree = true;

          environment.shellAliases = {
            switch = "darwin-rebuild switch --flake ~/.config/nix-darwin";
          };

          users.users."${username}" = {
            home = "/Users/${username}";
            description = username;
          };

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
      ];
    };

    formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;
  };
}
