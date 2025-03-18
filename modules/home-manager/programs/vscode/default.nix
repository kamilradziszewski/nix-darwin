{ pkgs, ... }: {
  enable = true;

  profiles = {
    default = {
      userSettings = import ./settings.nix;
      extensions = import ./extensions.nix { inherit pkgs; };
      languageSnippets = import ./snippets.nix;
    };
  };
}
