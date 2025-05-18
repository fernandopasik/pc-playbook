{ config, pkgs, ... }:

{
  homebrew.enable = true;

  homebrew.casks = [
    # Essentials
    "google-chrome"
    "google-drive"
    "spotify"
    "stats"
    "the-unarchiver"
    "vlc"

    # Chat
    "whatsapp"
    "zoom"

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
