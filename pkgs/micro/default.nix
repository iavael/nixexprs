{ stdenv, buildGoPackage, fetchFromGitHub }:

buildGoPackage rec {
  name = "micro-${version}";
  version = "20160926-${stdenv.lib.strings.substring 0 7 rev}";
  rev = "c1d08a6dc0984da786f7f49fa3b856c7f2219a11";

  goPackagePath = "github.com/zyedidia/micro";
  subPackages = [ "cmd/micro" ];

  src = fetchFromGitHub {
    inherit rev;
    owner = "zyedidia";
    repo = "micro";
    sha256 = "0yzlkdcny5d3a3qjcbldnsvhyc0wj6zwak6rhgbmhlkxkd6402x8";
  };

  goDeps = ./deps.nix;

  # TODO: add metadata https://nixos.org/nixpkgs/manual/#sec-standard-meta-attributes
  meta = {
  };
}
