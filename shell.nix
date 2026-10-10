{
  pkgs ? import <nixpkgs> { },
  ...
}:
pkgs.mkShellNoCC {
  packages = with pkgs; [
    spacetimedb
    cargo
    rustc
    lld
  ];
}
