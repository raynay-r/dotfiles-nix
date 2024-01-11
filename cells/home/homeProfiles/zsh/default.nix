let
  pkgs = inputs.nixpkgs;
  l = pkgs.lib // builtins;
in {
  home.packages = [
    pkgs.any-nix-shell
  ];

  programs.zsh = {
    enable = true;

    dotDir = ".config/zsh";
    autocd = true;
    enableAutosuggestions = true;
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
      source ${pkgs.zsh-z}/share/zsh-z/zsh-z.plugin.zsh
      source ${pkgs.zsh-bd}/share/zsh-bd/bd.plugin.zsh
      source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh
      
      ${l.fileContents ./_config/p10k.zsh}
      ${l.fileContents ./_config/extract.zsh}

      any-nix-shell zsh --info-right | source /dev/stdin
      eval "$(direnv hook zsh)"

      export PATH=$HOME/.krey/bin:$HOME/.local/bin:$PATH
    '';

    shellAliases = {
      home = "cd";
      ec = "cd ~/.config-nix; vim .";
    };
  };
}
