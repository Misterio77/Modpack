{ stdenv, packwiz }: stdenv.mkDerivation {
  pname = "modpack";
  version = "0.1.0";
  src = ./.;
  nativeBuildInputs = [ packwiz ];
  buildPhase = ''
  '';
  installPhase = ''
  '';
}
