{ nixpkgs
, username
, mac-app-util
, nixvim
, ...
}:
let
  pkgs = nixpkgs.pkgs;
in
{
  home-manager.useGlobalPkgs = true;

  home-manager.sharedModules = [
    mac-app-util.homeManagerModules.default
  ];

  home-manager.users.${username} = { pkgs, ... }: {
    home.stateVersion = "25.05";
    imports = [ nixvim.homeManagerModules.nixvim ];

    home.packages = with pkgs; [
      bat
      bottom
      fzf
      git
      goku
      lazygit
      mas
      neovim
      nixpkgs-fmt
      nodejs_22
      oh-my-posh
      ripgrep
      slack
      tmux

      nerd-fonts.jetbrains-mono
      nodePackages.http-server
    ];

    programs = {
      zsh = import ./programs/zsh.nix { inherit pkgs; };
      oh-my-posh = import ./programs/oh-my-posh.nix;
      zoxide = import ./programs/zoxide.nix;
      chromium = import ./programs/chromium.nix { inherit pkgs; };
      # nixvim = import ./programs/nixvim.nix;
      vscode = import ./programs/vscode { inherit pkgs; };
    };


    home.file = {
      ".config/ghostty/config".source = ./dotfiles/ghostty.toml;
      ".hammerspoon/init.lua".source = ./dotfiles/hammerspoon/init.lua;
      ".hammerspoon/modules/leftRightHotKey.lua".source =
        ./dotfiles/hammerspoon/modules/leftRightHotKey.lua;
      # ".hammerspoon/modules/textExpansion.lua".source =
      #   ./dotfiles/hammerspoon/modules/textExpansion.lua;
      ".hammerspoon/Spoons/SpoonInstall.spoon/init.lua".source =
        ./dotfiles/hammerspoon/SpoonInstall.spoon/init.lua;
    };
  };
}
