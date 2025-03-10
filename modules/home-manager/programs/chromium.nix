{ pkgs, ... }: {
  enable = true;
  package = pkgs.brave;

  commandLineArgs = [
    "--rewards=disabled"
    "--autoplay-policy=user-gesture-required"
  ];

  extensions = [
    { id = "nngceckbapebfimnlniiiahkandclblb"; } # Bitwarden Password Manager
    # pkgs.chromium-ublock-origin
    # pkgs.chromium-privacy-badger
    # pkgs.chromium-dark-reader
    # pkgs.chromium-https-everywhere
    # pkgs.chromium-privacy-redirect
    # pkgs.chromium-privacy-pass
    # pkgs.chromium-privacy-settings
  ];
}












