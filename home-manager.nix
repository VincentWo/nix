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
        ];
      };
    };
  }