{
  description = "nix-darwin flake config";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixpkgs-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    nix-darwin,
    nix-homebrew,
    ...
  }: let
    machine = import ./machine.nix;

    system = machine.system;
    username = machine.username;
    useremail = machine.useremail;
    hostname = machine.hostname;
  in {
    darwinConfigurations."${hostname}" = nix-darwin.lib.darwinSystem {
      inherit system;
      modules = [
        {
          nixpkgs.hostPlatform = system;
          networking.hostName = hostname;

          security.pam.enableSudoTouchIdAuth = true;
          nixpkgs.config.allowUnfree = true;

          environment.shellAliases = {
            switch = "darwin-rebuild switch --flake ~/.config/nix-darwin";
            nr = "npm run ";
          };

          users.users."${username}" = {
            home = "/Users/${username}";
            description = username;
          };

          homebrew = {
            enable = true;
            casks = [];
            onActivation.cleanup = "zap";
            onActivation.autoUpdate = true;
            onActivation.upgrade = true;
          };
        }

        home-manager.darwinModules.home-manager
        {
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

        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable = true;
            enableRosetta = true;
            user = username;
          };
        }

        ./modules/system.nix
      ];
    };

    formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;
  };
}
