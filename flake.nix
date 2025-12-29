{

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... } @ inputs:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    apps.${system} = {
      nvim = {
        type = "app";
        program = "${pkgs.callPackage ./nvim {}}/bin/nvim";
      };
    };

    devShells.${system} = {
      default = pkgs.mkShell {
        buildInputs = with pkgs; [
          elan
        ];
        shellHook = ''
          lake exe cache get
          du -sh .lake
        '';
      };
    };
  };
}
