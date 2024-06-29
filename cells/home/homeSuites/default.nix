{ cell, inputs, ... }:

let
  inherit (cell) homeProfiles;
in {
  rene = {
      home.username = "rene";
      home.stateVersion = "24.05";
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
        zsh
        tmux
        nushell
      ];
  };
  rene-wsl = {
      home.username = "rene";
      home.stateVersion = "24.05";
      home.homeDirectory = "/home/rene";

      imports = with homeProfiles; [ 
        direnv
        git
        k9s
        nvim
        zsh
        tmux
      ];
  };
}
