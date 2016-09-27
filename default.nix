{
  system ? builtins.currentSystem
}:

let
  pkgs = import <nixpkgs> { };

  callPackage = pkgs.lib.callPackageWith (pkgs // self);

  self = {
    ddnet = callPackage ./pkgs/ddnet { };
    goswagger = callPackage ./pkgs/goswagger { };
    micro = callPackage ./pkgs/micro { };
    gometalinter = callPackage ./pkgs/gometalinter { };
    manul = callPackage ./pkgs/manul { };
    lego = callPackage ./pkgs/lego { };
  };
in
self
