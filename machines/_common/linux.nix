{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ lsb-release ];

  system.stateVersion = "25.05";
}
