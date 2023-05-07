{
  description = "Modpack do misterinho";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }: utils.lib.eachDefaultSystem (system:
    let
      inherit (builtins) attrValues;
      pkgs = import nixpkgs { inherit system; };
    in
    rec {
      devShells = rec {
        modpack = pkgs.mkShell {
          name = "modpack";
          nativeBuildInputs = with pkgs; [ packwiz unzip zip yq ];
        };
        default = modpack;
      };
    });
}

