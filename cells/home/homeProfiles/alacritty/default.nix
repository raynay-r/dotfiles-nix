let
  colors = (import ../theme).colors;
in {
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal = {
          family = "UbuntuMono Nerd Font Mono";
          style = "Regular";
        };
        size = 13;
      };
      window = {
        opacity = 0.96;
      };
      colors = {
        primary = {
          background = colors.background;
          foreground = colors.foreground;
          bright_foreground = "#ffffff";
        };

        cursor = {
          text = "CellBackground";
          cursor = "CellForeground";
        };

        vi_mode_cursor = {
          text = "CellBackground";
          cursor = "CellForeground";
        };
        footer_bar = {
          background = colors.background;
          foreground = colors.foreground;
        };

        search = {
          matches = {
            background = colors.green;
            foreground = colors.selection;
          };

          focused_match = {
            background = colors.orange;
            foreground = colors.selection;
          };

        };

        hints = {
          start = {
            background = colors.background;
            foreground = colors.yellow;
          };

          end = {
            background = colors.yellow;
            foreground = colors.background;
          };
        };

        line_indicator = {
          background = "None";
          foreground = "None";
        };

        selection = {
          text = "CellForeground";
          background = colors.selection;
        };

        normal = {
          black = colors.black;
          red = colors.red;
          green = colors.green;
          yellow = colors.yellow;
          blue = colors.purple;
          magenta = colors.pink;
          cyan = colors.cyan;
          white = colors.foreground;
        };
      };
    };
  };
}
