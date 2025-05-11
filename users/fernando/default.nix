{ config, pkgs, ... }:
{
  users.users.fernando = {
    isNormalUser = true;
    home = "/home/fernando";
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "docker"
    ];
  };
}
