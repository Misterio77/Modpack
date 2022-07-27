{ stdenv, packwiz }: stdenv.mkDerivation {
  pname = "modpack";
  version = "0.1.0";
  src = ./.;
  buildInputs = [ packwiz ];
  buildPhase = ''
  '';
  installPhase = ''
  '';
}
