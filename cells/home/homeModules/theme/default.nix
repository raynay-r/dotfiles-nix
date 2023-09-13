{ config, lib, ... }:

with lib;
let
  cfg = config.theme;
in
{
  options.theme = {
    fonts = types.submodule {
      default = "";
      monospace = "";
    };

    colors = mkOption {
      type = types.submodule {
        options = {
          background = mkOption { type=types.str; default="#282a36"; };
          current-line = mkOption { type=types.str; default="#44475a"; };
          selection = mkOption { type=types.str; default="#44475a"; };
          foreground = mkOption { type=types.str; default="#f8f8f2"; };
          comment = mkOption { type=types.str; default="#6272a4"; };
          cyan = mkOption { type=types.str; default="#8be9fd"; };
          green = mkOption { type=types.str; default="#50fa7b"; };
          orange = mkOption { type=types.str; default="#ffb86c"; };
          pink = mkOption { type=types.str; default="#ff79c6"; };
          purple = mkOption { type=types.str; default="#bd93f9"; };
          red = mkOption { type=types.str; default="#ff5555"; };
          yellow = mkOption { type=types.str; default="#f1fa8c"; };
          gray = mkOption { type=types.str; default="#bfbfbf"; };
          black = mkOption { type=types.str; default="#21222c"; };
        };
      };
    };
  };
}
