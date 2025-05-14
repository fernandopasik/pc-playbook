{
  config,
  homeManagerModule,
  pkgs,
  wslModule,
  ...
}:

{
  imports = [
    wslModule
    homeManagerModule
    ../_common
    ../_common/linux.nix
    ../../modules/shell
    ../../modules/dev-tools
  ];

  networking.hostName = "uac";

  programs.nix-ld = {
    enable = true;
    package = pkgs.nix-ld-rs;
  };

  wsl.enable = true;
  wsl.defaultUser = "fernando";
}
