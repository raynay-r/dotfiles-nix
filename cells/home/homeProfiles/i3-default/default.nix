{ cell,  ... }:

let
  inherit (cell) homeModules;
in {
  imports = [
    homeModules.i3
  ];

  endgame.i3 = {
    enable = true;
  };
}
