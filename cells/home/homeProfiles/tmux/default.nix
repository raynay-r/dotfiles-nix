{ cell , inputs, ...}:

let
  pkgs = inputs.nixpkgs;
in {
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
