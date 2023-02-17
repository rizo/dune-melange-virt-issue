{ pkgs ? import <nixpkgs> { } }:

let
  ocamlPackages = pkgs.ocaml-ng.ocamlPackages_4_14;

  onix = import (builtins.fetchGit {
    url = "https://github.com/odis-labs/onix.git";
    rev = "53e2dd438f26aff09dc9c6fa9350127aaf97ea56";
  }) {
    inherit pkgs ocamlPackages;
    verbosity = "warning";
  };

  env = onix.env {
    repo = {
      url = "https://github.com/ocaml/opam-repository.git";
      rev = "ff615534bda0fbb06447f8cbb6ba2d3f3343c57e";
    };
    path = ./.;
    gitignore = ./.gitignore;
    deps = { "ocaml-system" = "*"; };

    overlay = self: super: {
      "melange" = super.melange.overrideAttrs (superAttrs: {
        postInstall = ''
          mkdir -p $out/lib/melange
          mv $out/lib/ocaml/${ocamlPackages.ocaml.version}/site-lib/melange/melange $out/lib/melange/melange
          cp -r $out/lib/ocaml/${ocamlPackages.ocaml.version}/site-lib/melange/runtime $out/lib/melange/runtime
        '';
      });
    };
  };

in {
  inherit (env) lock;
  shell = pkgs.mkShell { inputsFrom = [ env.pkgs.dune-melange-virt-issue ]; };
}
