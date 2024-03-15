{ cell , inputs, ...}:

let
  pkgs = inputs.nixpkgs;
  unstable = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux;
in {
  home.packages = with unstable; [ 
    tuxmux
  ];

  programs.tmux = {
    enable = true;
    prefix = "C-a";
    clock24 = true;
    keyMode = "vi";
    baseIndex = 1;
    plugins = with pkgs.tmuxPlugins; [
      sensible
      catppuccin
    ];
    extraConfig = builtins.readFile ./_config/tmux.conf;
  };
}
