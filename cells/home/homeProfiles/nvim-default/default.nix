{ cell,  ... }:

let
  inherit (cell) homeModules;
in {
  imports = [
    homeModules.nvim
  ];

  endgame.nvim = {
    enable = true;
  };
}
