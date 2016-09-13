{ stdenv, buildGoPackage, fetchFromGitHub }:

buildGoPackage rec {
  name = "manul-${version}";
  version = "20160827-${stdenv.lib.strings.substring 0 7 rev}";
  rev = "1d55759616aa5461e542636fd5755a0cb25dbbb0";

  goPackagePath = "github.com/kovetskiy/manul";

  src = fetchFromGitHub {
    inherit rev;
    owner = "kovetskiy";
    repo = "manul";
    sha256 = "1f21226afqq8baz8jf1qg13ay89sllqx27p5flpy6yvd160ik7lk";
  };

  goDeps = ./deps.json;
}
