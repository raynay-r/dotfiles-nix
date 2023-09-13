let
  inherit (cell) homeProfiles;
in {
  rene = {
      home.username = "rene";
      home.stateVersion = "23.05";
      home.homeDirectory = "/home/rene";
      
      imports = with homeProfiles; [ 
        alacritty 
        direnv
        git
        i3
        k9s
        nvim
        polybar
        rofi
      ];
  };
}
