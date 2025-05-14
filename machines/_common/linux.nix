{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # monitoring and info
    lsb-release
  ];

  programs.nix-ld = {
    enable = true;
    package = pkgs.nix-ld-rs;
  };

  system.stateVersion = "25.05";
}
