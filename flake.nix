{
  description = "Demo of regression in OpenVR";

  outputs = inputs@{ flake-parts, nixpkgs, systems, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [ ];
      systems = import systems;
      perSystem = { config, self', inputs', pkgs, system, ... }: {
        packages = {
          test32 = pkgs.pkgsCross.mingw32.callPackage (
            { stdenv, cmake }:
            stdenv.mkDerivation {
              name = "wineovrissue";
              version = "1.0.0";
              src = ./.;
              nativeBuildInputs = [ cmake ];
            }
          ) { };
          test64 = pkgs.pkgsCross.mingwW64.callPackage (
            { stdenv, cmake }:
            stdenv.mkDerivation {
              name = "wineovrissue";
              version = "1.0.0";
              src = ./.;
              nativeBuildInputs = [ cmake ];
            }
          ) { };
        };
      };
    };
}

