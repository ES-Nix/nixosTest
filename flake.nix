{
  description = "A usefull description";

  inputs.nixpkgs.url = "nixpkgs";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
    let
        pkgsAllowUnfree = import nixpkgs {
          system = "x86_64-linux";
          config = { allowUnfree = true; };
        };
    in
    {

       devShells.default = pkgsAllowUnfree.mkShell {
         buildInputs = with pkgsAllowUnfree; [ bashInteractive coreutils ];
       };

      checks = {
          test-nixos = import ./default.nix {
                pkgs = nixpkgs.legacyPackages."x86_64-linux";
              };
        };

  });
}
