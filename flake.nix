{
  description = "A usefull description";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
    let
        pkgsAllowUnfree = import nixpkgs {
          system = "x86_64-linux";
          config = { allowUnfree = true; };
        };

        nixos-lib = import (nixpkgs + "/nixos/lib") {};
    in
    {

       devShells.default = pkgsAllowUnfree.mkShell {
         buildInputs = with pkgsAllowUnfree; [ bashInteractive coreutils ];
       };

      checks = {
          test-nixos = nixos-lib.runTest {
            imports = [ ./test.nix ];

            hostPkgs = pkgsAllowUnfree;  # the Nixpkgs package set used outside the VMs
          };
        };

  });
}
