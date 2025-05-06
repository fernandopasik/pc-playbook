{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ vim git ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "24.11";
}
