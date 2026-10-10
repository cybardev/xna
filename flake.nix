{
  description = "Flake-based Nix devshell";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs?ref=nixpkgs-unstable";
  outputs =
    { nixpkgs, ... }:
    let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
      ];
      forEachSupportedSystem =
        f:
        nixpkgs.lib.genAttrs supportedSystems (
          system:
          f {
            pkgs = import nixpkgs {
              inherit system;
              config.allowUnfree = true;
            };
          }
        );
    in
    {
      devShells = forEachSupportedSystem (
        { pkgs }:
        {
          default = import ./shell.nix { inherit pkgs; };
        }
      );

      packages = forEachSupportedSystem (
        { pkgs }:
        let
          xna = pkgs.callPackage ./. { };
        in
        {
          inherit xna;
          default = xna;
        }
      );
    };
}
