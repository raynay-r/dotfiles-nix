{ cell,  ... }:

let
  inherit (cell) homeModules;
in {
  imports = [
    homeModules.theme
  ];

  endgame.theme = {
    enable = true;
  };
}
