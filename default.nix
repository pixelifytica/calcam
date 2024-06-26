let
  pkgs = import <nixpkgs> {};
  python = pkgs.python3;
in
  python.pkgs.callPackage ./calcam.nix {
    triangle = python.pkgs.callPackage ./triangle.nix {};
  }
