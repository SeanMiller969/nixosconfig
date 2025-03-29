{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    nix-vscode-extensions.inputs.nixpkgs.follows = "nixpkgs";

    plasma-manager.url = "github:nix-community/plasma-manager";
    plasma-manager.inputs.nixpkgs.follows = "nixpkgs";
    plasma-manager.inputs.home-manager.follows = "home-manager";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nix-vscode-extensions,
      plasma-manager,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.sean = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [
          ./nixos/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.sean = import ./nixos/home.nix;
            home-manager.backupFileExtension = "backup";
            home-manager.sharedModules = [ plasma-manager.homeManagerModules.plasma-manager ];
            home-manager.extraSpecialArgs = {
              inherit inputs;
              os = "linux";
              accountUsername = "sean";
              nix-vscode-extensions = nix-vscode-extensions.extensions.${system};
            };
          }
        ];
      };
    };
}
