{ inputs, config, ...}:
let 
  inherit (inputs.nixpkgs) lib;

  pkgs = inputs.nixpkgs;
  unstable = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux;

  cfg = config.endgame.tmux;
in with lib; {

  options.endgame.tmux = {
    enable = mkEnableOption "enable endgame direnv";
  };

  config = mkIf cfg.enable {

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
  };
}
