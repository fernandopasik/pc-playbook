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
    ../../modules/shell
    ../../modules/dev-tools
  ];

  networking.hostName = "Deimos";
}
