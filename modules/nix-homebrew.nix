{ username, ... }: {
  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = username;
  };
}
