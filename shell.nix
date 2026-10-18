{
  pkgs ? import <nixpkgs> { },
  ...
}:
pkgs.mkShellNoCC {
  packages = with pkgs; [
    spacetimedb

    # server
    cargo
    rustc
    lld

    # client
    pnpm
    nodejs
  ];
}
