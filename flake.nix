{
  description = "Fernando's NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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

        specialArgs = {
          wslModule = nixos-wsl.nixosModules.wsl;
          homeManagerModule = home-manager.nixosModules.home-manager;
        };

        modules = [
          ./machines/uac
          ./users/fernando
        ];
      };
    };
}
