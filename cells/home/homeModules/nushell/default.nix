{ inputs, config, ...}:
let 
  inherit (inputs.nixpkgs) lib;

  cfg = config.endgame.nushell;
in with lib; {

  options.endgame.nushell = {
    enable = mkEnableOption "enable endgame nushell";
  };

  config = mkIf cfg.enable {
    programs.nushell = {
      enable = true;
    };
  };
}
