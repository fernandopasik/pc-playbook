{ config, pkgs, ... }:

{
  homebrew.enable = true;

  homebrew.casks = [
    # Essentials
    "google-chrome"
    "stats"
    "the-unarchiver"
    "vlc"

    # QuickLook plugins
    "qlcolorcode"
    "qlmarkdown"
    "qlstephen"
    "quicklook-csv"
    "quicklook-json"
    "webpquicklook"
  ];

  system.primaryUser = "fernando";
  system.stateVersion = 6;
}
