{
  description = "Fernando's NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixos-wsl.url = "github:nix-community/NixOS-WSL";
  };

  outputs =
    {
      self,
      nixos-wsl,
      nixpkgs,
    }:
    {
      nixosConfigurations.uac = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./machines/uac
          nixos-wsl.nixosModules.wsl
          ./modules/shell
          ./modules/dev-tools
          ./users/fernando
        ];
      };
    };
}
