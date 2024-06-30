{ cell,  ... }:

let
  inherit (cell) homeModules;
in {
  imports = [
    homeModules.polybar
  ];

  endgame.polybar = {
    enable = true;
  };
}
