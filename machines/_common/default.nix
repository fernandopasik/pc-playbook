{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    curl
    gnupg
    htop
    iperf3
    lsb-release
    neofetch
    openssl
    rsync
    wget
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "24.11";
}
