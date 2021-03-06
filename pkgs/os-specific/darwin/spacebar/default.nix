{ stdenv, fetchFromGitHub, Carbon, Cocoa, ScriptingBridge }:

stdenv.mkDerivation rec {
  pname = "spacebar";
  version = "1.1.0";

  src = fetchFromGitHub {
    owner = "cmacrae";
    repo = pname;
    rev = "v${version}";
    sha256 = "0w0mkf4kb21aicb85zbp3m6nvk6m5306mchbd5nm988kgirmxnl4";
  };

  buildInputs = [ Carbon Cocoa ScriptingBridge ];

  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/share/man/man1/
    cp ./bin/spacebar $out/bin/spacebar
    cp ./doc/spacebar.1 $out/share/man/man1/spacebar.1
  '';

  meta = with stdenv.lib; {
    description = "A minimal status bar for macOS";
    homepage = "https://github.com/cmacrae/spacebar";
    platforms = platforms.darwin;
    maintainers = [ maintainers.cmacrae ];
    license = licenses.mit;
  };
}
