{ inputs, config, ...}:
let 
  inherit (inputs.nixpkgs) lib;

  cfg = config.custom.alacritty;
in with lib; {

  options.custom.alacritty = {
    enable = mkEnableOption "custom alacritty config";
    font = mkOption {
      type = types.str;
      default = "JetBrainsMono Nerd Font";
    };
    fontSize = mkOption {
      type = types.int;
      default = 14;
    };
  };

  config = mkIf cfg.enable {
    programs.alacritty = {
      enable = true;
      settings = {
        env = {
          TERM = "xterm-256color";
        };
        font = {
          normal = {
            family = cfg.font;
            style = "Regular";
          };
          bold= {
            family = cfg.font;
            style = "Bold";
          };
          italic = {
            family = cfg.font;
            style = "Italic";
          };
          bold_italic = {
            family = cfg.font;
            style = "Bold Italic";
          };
          size = cfg.fontSize;
          offset = {
            x = 0;
            y = 0;
          };
          glyph_offset = {
            x = 0;
            y = 0;
          };
        };
        window = {
          opacity = 1;
        };
        colors = {
          primary = {
            background = "#1E1E2E";
            foreground = "#CDD6F4";
            dim_foreground = "#CDD6F4";
            bright_foreground = "#CDD6F4";
          };

          cursor = {
            text = "#1E1E2E";
            cursor = "#F5E0DC";
          };

          vi_mode_cursor = {
            text = "#1E1E2E";
            cursor = "#B4BEFE";
          };

          search = {
            matches = {
              foreground = "#1E1E2E";
              background = "#A6ADC8";
            };

            focused_match = {
              foreground = "#1E1E2E";
              background = "#A6E3A1";
            };
          };

          hints = {
            start = {
              foreground = "#1E1E2E";
              background = "#F9E2AF";
            };

            end = {
              foreground = "#1E1E2E";
              background = "#A6ADC8";
            };
          };
          
          selection = {
            text = "#1E1E2E";
            background = "#F5E0DC";
          };

          normal = { 
            green = "#A6E3A1";
            yellow  ="#F9E2AF";
            blue = "#89B4FA";
            magenta = "#F5C2E7";
            cyan = "#94E2D5";
            white = "#BAC2DE";
          };

          bright = {
            black = "#585B70";
            red = "#F38BA8";
            green = "#A6E3A1";
            yellow = "#F9E2AF";
            blue = "#89B4FA";
            magenta = "#F5C2E7";
            cyan = "#94E2D5";
            white = "#A6ADC8";
          };

          dim = {
            black = "#45475A";
            red = "#F38BA8";
            green = "#A6E3A1";
            yellow = "#F9E2AF";
            blue = "#89B4FA";
            magenta = "#F5C2E7";
            cyan = "#94E2D5";
            white = "#BAC2DE";
          };
        };
      };
    };
  };
}
