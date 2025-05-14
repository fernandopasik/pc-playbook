{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # monitoring and info
    htop
    lsb-release
    neofetch
    pkg-config
    tree

    # networking
    curl
    iperf3
    rsync
    wget

    # encryption
    gnupg
    openssl

    # compression tools
    bzip2
    xz
    zlib
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = if pkgs.stdenv.isDarwin then 6 else "25.05";
}
