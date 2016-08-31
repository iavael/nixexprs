{ stdenv, buildGoPackage, fetchFromGitHub }:

buildGoPackage rec {
  name = "micro-${version}";
  version = "1.0.1";
  rev = "v${version}";

  goPackagePath = "github.com/zyedidia/micro";
  subPackages = [ "cmd/micro" ];

  src = fetchFromGitHub {
    inherit rev;
    owner = "zyedidia";
    repo = "micro";
    sha256 = "1gbr4jnzb4srclkyp0ws1qmlkgb3dgb9vfv0klnyqzhfpf1wsd34";
  };

  goDeps = ./deps.json;
}
