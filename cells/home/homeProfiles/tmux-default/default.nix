{ cell,  ... }:

let
  inherit (cell) homeModules;
in {
  imports = [
    homeModules.tmux
  ];

  endgame.tmux = {
    enable = true;
  };
}
