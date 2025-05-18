{ config, pkgs, ... }:

{
  homebrew.casks = [
    # IDE
    "visual-studio-code"

    # Fonts
    "font-jetbrains-mono"

    # Browsers
    "firefox"
    "microsoft-edge"

    # Chat
    "slack"
  ];
}
