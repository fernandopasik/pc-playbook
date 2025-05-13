{
  description = "Fernando's NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs =
    {
      self,
      home-manager,
      nixos-wsl,
      nixpkgs,
    }:
    {
      nixosConfigurations.uac = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./machines/uac
          nixos-wsl.nixosModules.wsl
          home-manager.nixosModules.home-manager
          ./users/fernando
        ];
      };
    };
}
