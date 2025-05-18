{ config, pkgs, ... }:

{
  homebrew.casks = [
    # IDE
    "visual-studio-code"

    # Browsers
    "firefox"
    "microsoft-edge"
  ];
}
