{
  config,
  lib,
  pkgs,
  ...
}:

let
  inherit (pkgs.stdenv) isDarwin isLinux;
in
{
  environment.systemPackages =
    with pkgs;
    [
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
    ]
    ++ lib.optionals isLinux [ lsb-release ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = if isDarwin then 6 else "25.05";

  programs.nix-ld = lib.mkIf isLinux {
    enable = true;
    package = pkgs.nix-ld-rs;
  };
}
