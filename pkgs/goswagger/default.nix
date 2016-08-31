{ stdenv, buildGoPackage, fetchFromGitHub }:

buildGoPackage rec {
  name = "goswagger-${version}";
  version = "0.5.9";
  rev = "${version}";

  goPackagePath = "github.com/go-swagger/go-swagger";

  src = fetchFromGitHub {
    inherit rev;
    owner = "go-swagger";
    repo = "go-swagger";
    sha256 = "073vds5n6731jfljsfd4ysd32i9g6a8w52azcm81jfm3zd5b38l6";
  };
}
