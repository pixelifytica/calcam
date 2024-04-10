{
  description = "Spatial calibration tools for science & engineering camera systems.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-23.11";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux"; # TODO add more systems
  in {
    packages.x86_64-linux = with (import nixpkgs {inherit system;}); rec {
      calcam-py311 = pkgs.python311.pkgs.callPackage ./derivation.nix {};
      calcam-py310 = pkgs.python310.pkgs.callPackage ./derivation.nix {};
      calcam-py39 = pkgs.python39.pkgs.callPackage ./derivation.nix {};
      default = calcam-py311;
    };
    devShells.x86_64-linux = let
      shell = version:
        with (import nixpkgs {inherit system;});
          mkShellNoCC {packages = [self.packages.x86_64-linux.${version}];};
    in
      builtins.listToAttrs (
        map (x: {
          name = x;
          value = shell x;
        }) ["calcam-py311" "calcam-py310" "calcam-py39" "default"]
      );
  };
}
