{ inputs, config, ...}:
let 
  inherit (inputs.nixpkgs) lib;

  cfg = config.endgame.polybar;

  colors = (import ../theme).colors;
  pkgs = inputs.nixpkgs;
in with lib; {

  options.endgame.polybar = {
    enable = mkEnableOption "enable endgame nushell";
  };

  config = mkIf cfg.enable {

    services.polybar = {
      enable = true;

      package = pkgs.polybar.override {
        #i3GapsSupport = true;
        alsaSupport = true;
        i3Support = true;
      };

      script = ''
        for m in $(${pkgs.xorg.xrandr}/bin/xrandr --query | ${pkgs.gnugrep}/bin/grep " connected" | ${pkgs.coreutils}/bin/cut -d" " -f1); do
          MONITOR=$m polybar --reload main&
        done
      '';

      settings = {

        colors = {
          background     = colors.background;
          foreground     = colors.foreground;
          primary        = colors.orange;
          secondary      = colors.comment;
          urgent         = colors.red;
        };

        "global/wm" = {
          margin-top = 0;
          margin-bottom = 0;
        };

        "bar/main" = {
          monitor = "\${env:MONITOR}";
          bottom = "false";
          fixed-center = "true";
          width = "100%";
          height = "40";
          offset-x = "10%";
          offset-y = "2%";
          background = "\${colors.background}";
          foreground = "\${colors.foreground}";
          radius-top = "0.0";
          radius-bottom = "0.0";
          line-size = "2";
          line-color = "\${colors.primary}";
          border-size = "3";
          border-color = "\${colors.background}";
          padding-left = "0";
          padding-right = "0";
          module-margin-left = "2";
          module-margin-right = "2";
          font-0 = "Ubuntu Nerd Font:size=16;4";
          separator = "|";
          modules-left = "i3";
          modules-center= "cpu memory filesystem network alsa";
          modules-right = "date tray";
        };

        "module/alsa" = {
          type = "internal/alsa";
          master-soundcard = "default";
          speaker-soundcard = "default";
          headphone-soundcard = "default";
          master-mixer = "Master";
          interval = "5";
          format-volume = "<ramp-volume> <label-volume>";
          format-volume-foreground = "\${colors.foreground}";
          format-muted = "<label-muted>";
          format-muted-prefix = "󰖁 ";
          format-muted-prefix-foreground = "\${colors.foreground}";
          label-volume = "%percentage%%";
          label-muted = " Muted";
          label-muted-foreground = "\${colors.foreground}";
          ramp-volume-0 = " ";
          ramp-volume-1 = " ";
          ramp-volume-2 = "󰕾 ";
          ramp-headphones-0 = "󰋋 ";
        };

        "module/cpu" = {
          type = "internal/cpu";
          interval = "1";
          format = "<label>";
          format-prefix = "󰻠 ";
          format-prefix-foreground = "\${colors.foreground}";
          label = "%percentage%%";
          label-foreground = "\${colors.foreground}";
        };

        "module/date" = {
          type = "internal/date";
          interval = "1.0";
          date = "󰸗 %a, %d %b";
          time = " %I:%M %p";
          format = "<label>";
          label = "%date%   %time%";
          label-foreground = "\${colors.foreground}";
        };

        "module/filesystem" = {
          type = "internal/fs";
          interval = "30";
          mount = [ "/" ];
          fixed-values = "true";
          spacing = "2";
          format-mounted = "<label-mounted>";
          format-mounted-prefix = "󰆼 ";
          format-mounted-prefix-foreground = "\${colors.foreground}";
          format-unmounted = "<label-unmounted>";
          format-unmounted-prefix = "󱘺 ";
          format-unmounted-prefix-foreground = "\${colors.foreground}";
          label-mounted = " %used% / %total%";
          label-mounted-foreground = "\${colors.foreground}";
          label-unmounted = " %mountpoint%: not mounted";
          label-unmounted-foreground = "\${colors.foreground}";
        };

        "module/memory" = {
          type = "internal/memory";
          interval = "1";
          format = "<label>";
          format-prefix = "󰍛 ";
          format-prefix-foreground = "\${colors.foreground}";
          label = "%gb_used% / %gb_free%";
          label-foreground = "\${colors.foreground}";
        };

        "module/network" = {
          type = "internal/network";
          interface = "enp8s0";
          label-connected = "%local_ip% (Up: %upspeed% | Down: %downspeed%)";
          label-connected-foreground = "\${colors.foreground}";
        };

        "module/i3" = {
          type = "internal/i3";

          pin-workspaces = "true";
          strip-wsnumbers = "true";
          index-sort = "true";

          ws-icon-0 = "1;  Browser";
          ws-icon-1 = "2;  Terminal";
          ws-icon-2 = "3;  Notes";
          ws-icon-3 = "4;  Email";
          ws-icon-4 = "5;  Chat";
          ws-icon-5 = "6;  6";
          ws-icon-6 = "7;  7";
          ws-icon-7 = "8;  8";
          ws-icon-8 = "9;  9";
          ws-icon-9 = "10;  10";
          ws-icon-default = "";

          format = "<label-state> <label-mode>";

          label-mode = "%mode%";
          label-mode-padding = "4";
          label-mode-background = "\${colors.urgent}";

          label-focused = "%icon%";
          label-focused-foreground = "\${colors.primary}";
          label-focused-underline = "\${colors.primary}";
          label-focused-padding = "2";

          label-unfocused = "%icon%";
          label-unfocused-foreground = "\${colors.secondary}";
          label-unfocused-padding = "2";

          label-visible = "%icon%";
          label-visible-foreground = "\${colors.secondary}";
          label-visible-padding = "2";

          label-urgent = "%icon%";
          label-urgent-foreground = "\${colors.urgent}";
          label-urgent-padding = "2";

          label-separator = "|";
          label-separator-padding = "2";
        };

        "module/tray" = {
          type = "internal/tray";

          format-margin = "8px";
          tray-spacing = "8px";
        };
      };
    };
  };
}
