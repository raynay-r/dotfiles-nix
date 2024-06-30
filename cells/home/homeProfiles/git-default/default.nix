{ cell,  ... }:

let
  inherit (cell) homeModules;
in {
  imports = [
    homeModules.git
  ];

  endgame.git = {
    enable = true;
  };
}
