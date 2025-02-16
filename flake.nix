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
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    nix-darwin,
    nix-homebrew,
    nix-vscode-extensions,
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

          nixpkgs.overlays = [
            nix-vscode-extensions.overlays.default
          ];

          environment.shellAliases = {
            switch = "darwin-rebuild switch --flake ~/.config/nix-darwin";
          };

          # environment.variables = {
          #   HOMEBREW_NO_ENV_HINTS = "1";
          # };

          users.users."${username}" = {
            home = "/Users/${username}";
            description = username;
          };

          homebrew = {
            enable = true;
            onActivation.cleanup = "zap";
            onActivation.autoUpdate = true;
            onActivation.upgrade = true;

            inherit (import ./modules/homebrew-apps.nix) brews casks masApps;
          };
        }

        home-manager.darwinModules.home-manager
        (import ./modules/home-manager.nix {inherit nixpkgs username;})

        nix-homebrew.darwinModules.nix-homebrew
        (import ./modules/nix-homebrew.nix {inherit username;})

        ./modules/system.nix
      ];
    };

    formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;
  };
}
