with import <nixpkgs> {};
  python3.withPackages (
    ps: [(ps.callPackage ./calcam.nix {triangle = ps.callPackage ./triangle.nix {};})]
  )
