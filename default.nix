{ stdenv, packwiz, zip, unzip }: stdenv.mkDerivation {
  pname = "modpack";
  version = "0.1.0";
  src = ./.;
  nativeBuildInputs = [ packwiz zip unzip ];
  buildPhase = ''
  '';
  installPhase = ''
  '';
}
