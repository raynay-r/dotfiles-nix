{ cell, inputs, ... }:

let
  inherit (cell) homeProfiles;

  rene = {
    username = "rene";
    stateVersion = "24.05";
    homeDirectory = "/home/rene";
  };
in {
  rene = {
    home = rene;

    imports = with homeProfiles; [
      alacritty-default
      direnv-default
      git-default
      i3-default
      k9s-default
      nvim-default
      polybar-default
      rofi-default
      zsh-default
      tmux-default
      nushell-default
    ];
  };

  rene-wsl = {
    home = rene;

    imports = with homeProfiles; [
      direnv-default
      git-default
      k9s-default
      nvim-default
      zsh-default
      tmux-default
    ];
  };
}
