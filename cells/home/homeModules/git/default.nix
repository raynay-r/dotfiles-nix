{ inputs, config, ...}:
let 
  inherit (inputs.nixpkgs) lib;
  pkgs = inputs.nixpkgs;

  cfg = config.endgame.git;
in with lib; {

  options.endgame.git = {
    enable = mkEnableOption "enable endgame git";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      dotnet-sdk_7
    ];

    programs.git = {
      enable = true;

      userName = "rene";
      userEmail = "rene.raab@gmx.net";

      extraConfig = {
        pull.rebase = false;
        rerere = {
          enabled = true;
        };
        credential = {
          credentialStore = "gpg";
          helper = "/run/current-system/sw/bin/git-credential-manager";
          bitbucketAuthModes = "basic";
          useHttpPath = true;
        };
        "credential \"https://git.brz.gv.at/bitbucket\"" = {
          provider = "bitbucket";
        };
      };

      aliases = {
        a = "add -p";
        co = "checkout";
        cob = "checkout -b";
        f = "fetch -p";
        c = "commit";
        p = "push";
        ba = "branch -a";
        bd = "branch -d";
        bD = "branch -D";
        d = "diff";
        dc = "diff --cached";
        ds = "diff --staged";
        r = "restore";
        rs = "restore --staged";
        st = "status -sb";

        # reset
        soft = "reset --soft";
        hard = "reset --hard";
        s1ft = "soft HEAD~1";
        h1rd = "hard HEAD~1";

        # logging
        lg =
          "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
        plog =
          "log --graph --pretty='format:%C(red)%d%C(reset) %C(yellow)%h%C(reset) %ar %C(green)%aN%C(reset) %s'";
        tlog =
          "log --stat --since='1 Day Ago' --graph --pretty=oneline --abbrev-commit --date=relative";
        rank = "shortlog -sn --no-merges";

        # delete merged branches
        bdm = "!git branch --merged | grep -v '*' | xargs -n 1 git branch -d";
      };
    };
  };
}
