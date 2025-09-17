{
  description = "An i3-like tiling window manager for macOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.05";
  };

  outputs = { self, nixpkgs }: {

    packages.aarch64-darwin.default =
      with import nixpkgs
        {
          system = "aarch64-darwin";
        };
      stdenv.mkDerivation {
        name = "aerospace";
        version = "0.19.2-Beta";
        src = fetchzip {
          url = "https://github.com/nikitabobko/AeroSpace/releases/download/v0.19.2-Beta/AeroSpace-v0.19.2-Beta.zip";
          hash = "sha256-6RyGw84GhGwULzN0ObjsB3nzRu1HYQS/qoCvzVWOYWQ=";
        };

        unpackPhase = ''
          ls -lah $src/
          cp -r $src/ $out/
        '';
      };

  };
}
