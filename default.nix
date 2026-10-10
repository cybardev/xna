{
  lib,
  rustPlatform,
}:
rustPlatform.buildRustPackage (finalAttrs: {
  pname = "xna";
  version = "0.1.0";

  src = ./backend;

  cargoHash = "sha256-PMPjtnxYBcMSeWxR5PYD8ekxTuiZKNuo5ccQ86AATUU=";

  meta = {
    description = "SpacetimeDB project scaffold with Nix";
    homepage = "https://github.com/cybardev/xna";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [
      cybardev
    ];
  };
})
