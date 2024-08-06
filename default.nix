let
  pkgs = import <nixpkgs> { };
  python = pkgs.python3;
  triangle = python.pkgs.callPackage ./triangle.nix { };
  calcam = python.pkgs.callPackage ./derivation.nix {
    inherit triangle;
    opencv4 = (
      python.pkgs.opencv4.overrideAttrs {
        enablePython = true;
        enableVtk = true;
        doCheck = false;
      }
    );
  };
in
{
  inherit calcam;
}
