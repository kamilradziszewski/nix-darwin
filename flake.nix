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
    mac-app-util = {
      url = "github:hraban/mac-app-util";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    nix-darwin,
    nix-homebrew,
    nix-vscode-extensions,
    mac-app-util,
    nixvim,
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

          security.pam.services.sudo_local.touchIdAuth = true;
          nixpkgs.config.allowUnfree = true;

          nixpkgs.overlays = [
            nix-vscode-extensions.overlays.default
          ];

          environment.shellAliases = {
            switch = "darwin-rebuild switch --flake ~/.config/nix-darwin";
            switch-update = "nix --extra-experimental-features 'nix-command flakes' flake update --flake ~/.config/nix-darwin";
            switch-clean = "nix-collect-garbage -d";
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

        mac-app-util.darwinModules.default

        home-manager.darwinModules.home-manager
        (import ./modules/home-manager.nix {inherit nixpkgs username mac-app-util nixvim;})

        nix-homebrew.darwinModules.nix-homebrew
        (import ./modules/nix-homebrew.nix {inherit username;})

        ./modules/system.nix
      ];
    };

    formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;
  };
}
