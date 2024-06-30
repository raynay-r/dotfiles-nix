{ cell,  ... }:

let
  inherit (cell) homeModules;
in {
  imports = [
    homeModules.zsh
  ];

  endgame.zsh = {
    enable = true;
  };
}
