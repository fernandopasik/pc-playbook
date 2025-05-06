{ config, pkgs, ... }:

{
  imports = [
    ../_common
  ];

  wsl.enable = true;
  wsl.defaultUser = "nixos";
}
