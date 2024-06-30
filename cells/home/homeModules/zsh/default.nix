{ inputs, config, ...}:
let 
  pkgs = inputs.nixpkgs;
  inherit (inputs.nixpkgs) lib;

  cfg = config.endgame.zsh;
in with lib; {

  options.endgame.zsh = {
    enable = mkEnableOption "enable endgame direnv";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
        any-nix-shell
        zoxide
    ];

    programs.zsh = {
      enable = true;

      dotDir = ".config/zsh";
      autocd = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      history = {
        expireDuplicatesFirst = true;
        extended = true;
        ignoreSpace = true;
      };

      historySubstringSearch = {
        enable = true;
        searchUpKey = [ "^[OA" "^[[A" ];
        searchDownKey = [ "^[OB" "^[[B" ];
      };

      initExtra = ''
        zsh-newuser-install() { :; }
        
        source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
        source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
        source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh
        
        ${fileContents ./_config/p10k.zsh}
        ${fileContents ./_config/extract.zsh}

        any-nix-shell zsh --info-right | source /dev/stdin
        eval "$(direnv hook zsh)"
        eval "$(zoxide init --hook none zsh)"

        export PATH=$HOME/.krey/bin:$HOME/.local/bin:$PATH
      '';

      shellAliases = {
        home = "cd";
        ec = "cd ~/.config-nix; vim .";
      };
    };
  };
}
