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
    ../../modules/shell
    ../../modules/dev-tools
  ];

  networking.hostName = "uac";

  wsl.enable = true;
  wsl.defaultUser = "fernando";
}
