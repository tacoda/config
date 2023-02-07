packages.default = python.pkgs.buildPythonApplication {
  name = "zero-to-nix-python";

  buildInputs = with python.pkgs; [ pip ];

  src = ./.;
};
