{ inputs, config, ...}:
let 
  inherit (inputs.nixpkgs) lib;
  pkgs = inputs.nixpkgs;

  mod = "Mod4";
  colors = (import ../theme).colors;

  cfg = config.endgame.i3;
in with lib; {
  options.endgame.i3 = {
    enable = mkEnableOption "enable endgame i3";
  };

  config = mkIf cfg.enable {
    xsession.windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;

      config = {
        modifier = mod;
        terminal = "alacritty";
        menu = "$HOME/.config/rofi/launcher/launcher.sh";

        startup = [
          { command = "systemctl --user restart polybar"; always = true; notification = false; }
          { command = "feh --bg-fill --no-xinerama /home/rene/Pictures/Wallpapers/wallpaper-1.png"; always = true; notification = false; }
        ];

        window = lib.mkOptionDefault {
          titlebar = false;
          border = 1;
        };

        floating = lib.mkOptionDefault {
          titlebar = false;
          border = 1;
        };

        keybindings = lib.mkOptionDefault {
          # rofi screenshot
          "${mod}+x" = "exec --no-startup-id $HOME/.config/rofi/screenshot/screenshot.sh";

          # rofi powermenu
          "${mod}+Delete" = "exec --no-startup-id $HOME/.config/rofi/powermenu/powermenu.sh";

          # switch to next or previous workspace
          "${mod}+Tab" = "workspace next";
          "${mod}+Shift+Tab" = "workspace prev";

          # change gaps
          "${mod}+g" = "gaps inner current plus 5";
          "${mod}+Shift+g" = "gaps inner current minus 5";
          "${mod}+q" = "gaps horizontal current toggle 1000";

          # Focus
          "${mod}+h" = "focus left";
          "${mod}+j" = "focus down";
          "${mod}+k" = "focus up";
          "${mod}+l" = "focus right";

          # Move window
          "${mod}+Shift+h" = "move left";
          "${mod}+Shift+j" = "move down";
          "${mod}+Shift+k" = "move up";
          "${mod}+Shift+l" = "move right";

          # Move workspace
          "${mod}+o" = "exec i3-msg move workspace to output left";
          "${mod}+p" = "exec i3-msg move workspace to output right";

          # Split
          "${mod}+v" = "split v";
          "${mod}+b" = "split h";

          #Modes
          "${mod}+m" = "focus floating; mode move";
        };

        modes = lib.mkOptionDefault {
          resize = {
            Escape = "mode default";

            Left = "resize shrink width 10 px or 10 ppt";
            Down = "resize grow height 10 px or 10 ppt";
            Up = "resize shrink height 10 px or 10 ppt";
            Right = "resize grow width 10 px or 10 ppt";

            h = "resize shrink width 10 px or 10 ppt";
            j = "resize shrink height 10 px or 10 ppt";
            k = "resize grow height 10 px or 10 ppt";
            l = "resize grow width 10 px or 10 ppt";
          };

          move = {
            Escape = "mode default";

            Left = "move left 20px";
            Down = "move down 20px";
            Up = "move up 20px";
            Right = "move right 20px";

            h = "move left 20px";
            j = "move down 20px";
            k = "move up 20px";
            l = "move right 20px";
          };
        };

        workspaceOutputAssign = [
          { workspace = "1"; output = "HDMI-0"; }
  #        { workspace = "1"; output = "DP-2"; }
  #        { workspace = "2"; output = "DP-2"; }
  #        { workspace = "3"; output = "DP-2"; }
  #        { workspace = "9"; output = "DP-4"; }
  #        { workspace = "10"; output = "DP-0"; }
        ];

        colors = {
          focused = {
            border = colors.orange;
            background = colors.orange;
            text = colors.foreground;
            indicator = colors.orange;
            childBorder = colors.orange;
          };

          focusedInactive = {
            border = colors.selection;
            background = colors.selection;
            text = colors.foreground;
            indicator = colors.selection;
            childBorder = colors.selection;
          };

          unfocused = {
            border = colors.background;
            background = colors.background;
            text = colors.gray;
            indicator = colors.background;
            childBorder = colors.background;
          };

          urgent = {
            border = colors.selection;
            background = colors.red;
            text = colors.foreground;
            indicator = colors.red;
            childBorder = colors.red;
          };

          placeholder = {
            border = colors.background;
            background = colors.background;
            text = colors.foreground;
            indicator = colors.background;
            childBorder = colors.background;
          };
        };

        gaps = {
          inner = 12;
          vertical = 220;
          horizontal = 450;
          #outer = 0;
          #outer = -2; -- commented out until polybar is fixed (polybar version > 3.6.3)
        };

        bars = [];
      };
    };
  };
}
