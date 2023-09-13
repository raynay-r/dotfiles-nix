let
  colors = (import ../theme).colors;
in {
  xdg.configFile."rofi/shared/colors.rasi".text = ''
    * {
      background: ${colors.background};
      background-alt: ${colors.comment};
      foreground: ${colors.foreground};
      selected: ${colors.orange};
      active: ${colors.orange};
      urgent: ${colors.red};
    }
  ''; 
  
  xdg.configFile."rofi/shared/fonts.rasi".text = ''
    * {
      font: "Ubuntu Mono Nerd Font 16";
    }
  ''; 

  xdg.configFile."rofi/powermenu".source = ./_powermenu; 
  xdg.configFile."rofi/launcher".source = ./_launcher; 
  xdg.configFile."rofi/screenshot".source = ./_screenshot; 

  programs.rofi = {
    enable = true;
  };
}
