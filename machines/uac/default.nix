{ config, pkgs, ... }:

{
  imports = [ ../_common ];

  networking.hostName = "uac";

  wsl.enable = true;
  wsl.defaultUser = "nixos";
}
