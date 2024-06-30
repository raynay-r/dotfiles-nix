{ cell,  ... }:

let
  inherit (cell) homeModules;
in {
  imports = [
    homeModules.rofi
  ];

  endgame.rofi = {
    enable = true;
  };
}
