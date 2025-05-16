{ config, pkgs, ... }:

{
  homebrew.enable = true;

  system.primaryUser = "fernando";
  system.stateVersion = 6;
}
