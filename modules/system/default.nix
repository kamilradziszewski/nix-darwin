{ username, ... }: {
  system = {
    stateVersion = 6;

    defaults = {
      dock = import ./defaults.dock.nix;
      finder = import ./defaults.finder.nix { inherit username; };
    };
  };
}
