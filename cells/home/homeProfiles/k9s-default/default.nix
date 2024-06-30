{ cell,  ... }:

let
  inherit (cell) homeModules;
in {
  imports = [
    homeModules.k9s
  ];

  endgame.k9s = {
    enable = true;
  };
}
