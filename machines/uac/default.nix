{ config, pkgs, ... }:

{
  imports = [
    ../_common
    ../../modules/shell
    ../../modules/dev-tools
  ];

  networking.hostName = "uac";

  wsl.enable = true;
  wsl.defaultUser = "fernando";
}
