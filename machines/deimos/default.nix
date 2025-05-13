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
  ];

  networking.hostName = "Deimos";
}
