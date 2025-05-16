{
  config,
  homeManagerModule,
  pkgs,
  ...
}:

{
  imports = [
    homeManagerModule
    ../_common
    ../_common/darwin.nix
    ../../modules/shell
    ../../modules/dev-tools
  ];

  networking.hostName = "Deimos";
}
