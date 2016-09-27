{ stdenv, buildGoPackage, fetchFromGitHub }:

buildGoPackage rec {
  name = "manul-${version}";
  version = "20160926-${stdenv.lib.strings.substring 0 7 rev}";
  rev = "5d10370db6d1bdf683ccd5bf737d35c6cf18baf7";

  goPackagePath = "github.com/kovetskiy/manul";

  src = fetchFromGitHub {
    inherit rev;
    owner = "kovetskiy";
    repo = "manul";
    sha256 = "0jkhp3lr5dx32b2qjp0pgrg7di03zwvk37ygmnxkj1avjhxvsq48";
  };

  goDeps = ./deps.nix;

  # TODO: add metadata https://nixos.org/nixpkgs/manual/#sec-standard-meta-attributes
  meta = {
  };
}
