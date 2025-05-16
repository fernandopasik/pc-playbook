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
  ];

  networking.hostName = "Deimos";
}
