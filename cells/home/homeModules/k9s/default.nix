{ inputs, config, ...}:
let 
  inherit (inputs.nixpkgs) lib;

  cfg = config.endgame.k9s;
in with lib; {

  options.endgame.k9s = {
    enable = mkEnableOption "enable endgame k9s";
  };

  config = mkIf cfg.enable {
    programs.k9s = {
      enable = true;
    };
  };
}
