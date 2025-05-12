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

  home-manager.users.fernando =
    { pkgs, ... }:
    {
      home = {
        homeDirectory = "/home/fernando";
        stateVersion = "24.11";
        username = "fernando";

        file."repos/.keep".text = "";
      };
    };
}
