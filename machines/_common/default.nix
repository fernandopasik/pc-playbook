{ config, lib, pkgs, ... }:

let
  isLinux = pkgs.stdenv.isLinux;
in {
  environment.systemPackages = with pkgs; [
    # monitoring and info
    htop
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
  ] ++ lib.optionals pkgs.stdenv.isLinux [
    lsb-release
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = if pkgs.stdenv.isDarwin then 6 else "25.05";
} // lib.mkIf isLinux {
  programs.nix-ld = {
    enable = true;
    package = pkgs.nix-ld-rs;
  };
}
