{ inputs, config, ...}:
let 
  inherit (inputs.nixpkgs) lib;

  cfg = config.endgame.direnv;
in with lib; {

  options.endgame.direnv = {
    enable = mkEnableOption "enable endgame direnv";
  };

  config = mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      nix-direnv = {
        enable = true;
      };
    };
  };
}
