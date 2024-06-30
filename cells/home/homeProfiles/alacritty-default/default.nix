{ cell,  ... }:

let
  inherit (cell) homeModules;
in {
  imports = [
    homeModules.alacritty
  ];

  endgame.alacritty = {
    enable = true;
  };
}
