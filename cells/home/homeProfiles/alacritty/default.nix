let
  colors = (import ../theme).colors;
  font = "JetBrainsMono Nerd Font";
in {
  programs.alacritty = {
    enable = true;
    settings = {
      env = {
        TERM = "xterm-256color";
      };
      font = {
        normal = {
          family = font;
          style = "Regular";
        };
        bold= {
          family = font;
          style = "Bold";
        };
        italic = {
          family = font;
          style = "Italic";
        };
        bold_italic = {
          family = font;
          style = "Bold Italic";
        };
        size = 14;
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
     # colors = {
     #   primary = {
     #     background = "#24273A";
     #     foreground = "#CAD3F5";
     #     dim_foreground = "#CAD3F5";
     #     bright_foreground = "#CAD3F5";
     #   };

     #   cursor = {
     #     text = "#24273A";
     #     cursor = "#F4DBD6";
     #   };

     #   vi_mode_cursor = {
     #     text = "#24273A";
     #     cursor = "#B7BDF8";
     #   };

     #   search = {
     #     matches = {
     #       foreground = "#24273A";
     #       background = "#A5ADCB";
     #     };

     #     focused_match = {
     #       foreground = "#24273A";
     #       background = "#A5ADCB";
     #     };

     #     footer_bar = {
     #       foreground = "#24273A";
     #       background = "#A5ADCB";
     #     };
     #   };

     #   hints = {
     #     start = {
     #       foreground = "#24273A";
     #       background = "#EED49F";
     #     };

     #     end = {
     #       foreground = "#24273A";
     #       background = "#A5ADCB";
     #     };
     #   };
     #   
     #   selection = {
     #     text = "#24273A";
     #     background = "#F4DBD6";
     #   };

     #   normal = { 
     #     black = "#494D64";
     #     red = "#ED8796";
     #     green = "#A6DA95";
     #     yellow = "#EED49F";
     #     blue = "#8AADF4";
     #     magenta = "#F5BDE6";
     #     cyan = "#8BD5CA";
     #     white = "#B8C0E0";
     #   };

     #   bright = {
     #     black = "#5B6078";
     #     red = "#ED8796";
     #     green = "#A6DA95";
     #     yellow = "#EED49F";
     #     blue = "#8AADF4";
     #     magenta = "#F5BDE6";
     #     cyan = "#8BD5CA";
     #     white = "#A5ADCB";
     #   };

     #   dim = {
     #     black = "#494D64";
     #     red = "#ED8796";
     #     green = "#A6DA95";
     #     yellow = "#EED49F";
     #     blue = "#8AADF4";
     #     magenta = "#F5BDE6";
     #     cyan = "#8BD5CA";
     #     white = "#B8C0E0";
     #   };
     # };
    };
  };
}
