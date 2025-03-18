# https://mynixos.com/nix-darwin/options/system.defaults.finder
{ username, ... }: {
  _FXShowPosixPathInTitle = true;
  AppleShowAllExtensions = true;
  FXDefaultSearchScope = null;
  FXPreferredViewStyle = "Nlsv";
  FXRemoveOldTrashItems = true;
  NewWindowTarget = "Other";
  NewWindowTargetPath = "file:///Users/${username}/Downloads";
  ShowExternalHardDrivesOnDesktop = false;
  ShowHardDrivesOnDesktop = false;
  ShowMountedServersOnDesktop = false;
  ShowPathbar = true;
  ShowRemovableMediaOnDesktop = false;
  ShowStatusBar = true;
}
