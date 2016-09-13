{ stdenv, buildGoPackage, fetchFromGitHub }:

buildGoPackage rec {
  name = "gometalinter-${version}";
  version = "1.0.1";
  rev = "v${version}";

  goPackagePath = "github.com/alecthomas/gometalinter";

  src = fetchFromGitHub {
    inherit rev;
    owner = "alecthomas";
    repo = "gometalinter";
    sha256 = "00rcawhg9kyj83c2mvhgc3sw7xdy45s2vikvx53g5rhk7gi19p9s";
  };

  goDeps = ./deps.json;
}
