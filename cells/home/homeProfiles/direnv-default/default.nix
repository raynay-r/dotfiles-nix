{ cell,  ... }:

let
  inherit (cell) homeModules;
in {
  imports = [
    homeModules.direnv
  ];

  endgame.direnv = {
    enable = true;
  };
}
