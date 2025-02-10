# https://mynixos.com/nix-darwin/options/system.defaults.dock
{
  # Whether to automatically hide and show the dock. The default is false.
  autohide = true;

  # Sets the speed of the autohide delay. The default is given in the example.
  # autohide-delay = 1.0;
  autohide-delay = null;

  # Position of the dock on screen. The default is "bottom".
  orientation = "left";

  # Persistent applications in the dock.
  # persistent-apps = [
  #     "/Applications/TIDAL.app"
  # ];

  # Persistent folders in the dock.
  # persistent-others = [
  #   "~/Downloads"
  # ];

  # Show indicator lights for open applications in the Dock. The default is true.
  show-process-indicators = true;

  # Show recent applications in the dock. The default is true.
  show-recents = false;

  # Whether to make icons of hidden applications tranclucent. The default is false.
  showhidden = true;

  # Show only open applications in the Dock. The default is false.
  static-only = true;

  # Size of the icons in the dock. The default is 64.
  tilesize = 64;
}
