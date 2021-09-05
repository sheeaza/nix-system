{
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-21.05;
    flake-utils.url = github:numtide/flake-utils;
    nvim.url = github:sheeaza/nix-nvim;
  };

  outputs = { self, ... }@inputs: {
    nixosConfigurations.max = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        { _module.args = inputs; }
        ./configuration.nix
      ];
    };
  };
}
