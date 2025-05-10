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

  environment.variables.PKG_CONFIG_PATH = pkgs.lib.makeSearchPathOutput "dev" "lib/pkgconfig" [
    pkgs.zlib
    pkgs.openssl
    pkgs.bzip2
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "24.11";
}
