{ cell , inputs, ...}:

let
  pkgs = inputs.nixpkgs;
  unstable = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux;
in {
  home.packages = with unstable; [ 
    tuxmux
    sesh
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
      tmux-fzf
    ];
    extraConfig = builtins.readFile ./_config/tmux.conf;
  };

  home.file.".config/sesh/sesh.toml" = {
    source = ./_config/sesh.toml;
    recursive = true;
  };
}
