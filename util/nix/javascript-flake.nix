{
  packages.default = pkgs.buildNpmPackage {
    name = "zero-to-nix-javascript";

    # The packages required by the build process
    buildInputs = [
      pkgs.nodejs-18_x
    ];

    # The code sources for the package
    src = ./.;
    npmDepsHash = "sha256-Ghh9jxxJH7lgn99X1L6WAhrsQhnJlub2cyUUBmSBwfQ=";

    # How the output of the build phase
    installPhase = ''
      mkdir $out
      npm run build
      cp dist/index.html $out
    '';
  }
}
