{ cell, inputs, ... }:

let
  inherit (cell) homeModules;
in {
  imports = [
    homeModules.alacritty
  ];

  custom.alacritty = {
    enable = true;
  };
}
