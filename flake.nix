{
  description = "Python development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
  };

  outputs =
    { nixpkgs, ... }:
    let
      system = "x86_64-linux";
    in
    {
      devShells.${system} =
        let
          pkgs = import nixpkgs {
            inherit system;
          };
          python3 = pkgs.python310;
          # A set of system dependencies for Python modules.
          # They act as build inputs and are used to configure
          # LD_LIBRARY_PATH in the shell.
          systemPackages = with pkgs; [
            stdenv.cc.cc.lib
          ];
          pythonRequirements = pkgs.writeText "requirements.txt" ''
            autoeq
          '';
        in
        {
          default = pkgs.mkShell {
            venvDir = ".venv";

            buildInputs = [
              # A Python interpreter including the 'venv' module is required to bootstrap the environment.
              (python3.withPackages (ps: with ps; [ ]))

              python3.pkgs.venvShellHook
              python3.pkgs.pip
            ]
            ++ systemPackages;

            postVenvCreation = ''
              unset SOURCE_DATE_EPOCH
            '';

            LD_LIBRARY_PATH = "${pkgs.lib.makeLibraryPath systemPackages}";

            postShellHook = ''
              unset SOURCE_DATE_EPOCH
              # https://discourse.nixos.org/t/using-nix-develop-opens-bash-instead-of-zsh/25075/13
              exec zsh
              pip install -r ${pythonRequirements}
            '';
          };
        };
    };
}
