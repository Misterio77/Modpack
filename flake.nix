{
  description = "Modpack do misterinho";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }:
    {
      overlays = rec {
        modpack = _final: prev: {
          modpack = prev.callPackage ./. { };
        };
      };
    } //
    (utils.lib.eachDefaultSystem (system:
      let
        inherit (builtins) attrValues;
        pkgs = import nixpkgs { inherit system; overlays = attrValues self.overlays; };
      in
      rec {
        packages = rec {
          inherit (pkgs) modpack;
          default = modpack;
        };

        devShells = rec {
          modpack = pkgs.mkShell {
            name = "modpack";
            inputsFrom = [ packages.modpack ];
          };
          default = modpack;
        };
      }));
}

