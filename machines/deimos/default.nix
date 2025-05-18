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
    ../../modules/dev-tools/darwin.nix
    ../../modules/docker/darwin.nix
    ../../modules/apps/darwin.nix
  ];

  networking.hostName = "Deimos";
}
