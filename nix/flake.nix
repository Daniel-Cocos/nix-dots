{
  description = "Config Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... } @inputs: {
    nixosConfigurations = {
      pc = nixpkgs.lib.nixosSystem {
        #system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/pc/default.nix
          home-manager.nixosModules.home-manager
        ];
      };

      laptop = nixpkgs.lib.nixosSystem {
        #system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/laptop/default.nix
          home-manager.nixosModules.home-manager
        ];
      };
    };
  };
}
