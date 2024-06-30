{ cell,  ... }:

let
  inherit (cell) homeModules;
in {
  imports = [
    homeModules.nushell
  ];

  endgame.nushell = {
    enable = true;
  };
}
