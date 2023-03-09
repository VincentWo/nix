{ config, pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in
  {
    imports = [
      (import "${home-manager}/nixos")
    ];

    # todo: find a way to differentiate the user
    home-manager.users = {
      root = {
        imports = [
          ./common-home.nix
        ];
      };
      titania = {
        imports = [
          ./common-home.nix
        ];
        home.packages = with pkgs; [
          firefox
          hyprland
          alacritty
          fuzzel
          pinentry_qt5

          # ocaml dev
          ocaml
          ocamlformat
          ocamlPackages.utop
          ocamlPackages.dune_3
          ocamlPackages.ocaml-lsp
        ];
      };
    };
  }
