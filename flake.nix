{
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;

    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  
  outputs = { self, nixpkgs, nix-vscode-extensions }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      modules = [ ./nixos/configuration.nix ];
    };
  };
}