{ inputs, ...}:
let
  pkgs = inputs.nixpkgs;
  unstable = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux;
in
{
  time.timeZone = "Europe/Vienna";

  environment = {
    systemPackages = (with pkgs; [
      wget
      curl
      git
      tmux
      unzip
      bat
      eza
      lazygit
      ripgrep
      fzf
      fd
      kubectl
      k9s
      krew
      istioctl
      argocd
      (wrapHelm kubernetes-helm { 
        plugins = [ 
          pkgs.kubernetes-helmPlugins.helm-diff 
        ]; 
      })
      openshift
      kubeseal
      gomplate
      pandoc
      gnupg
      pinentry-curses
      jq
      tldr
      cht-sh
      crc
      sops
      age
      gnupg
      pass
      git-credential-manager
      ansible
      ranger
    ]) ++ (with unstable; [
      helmfile
    ]);

    pathsToLink = [
      "/share/zsh"
    ];

    variables = {
      EDITOR = "vim";
    };

    shells = with pkgs; [ zsh ];
  };

  fonts.packages = with pkgs; [ nerdfonts ];

  services.pcscd.enable = true;

  programs.zsh.enable = true;

  programs.gnupg.agent = {
     enable = true;
     pinentryFlavor = "curses";
     enableSSHSupport = true;
  };

  users = {
    defaultUserShell = pkgs.zsh;
  };

  nix = {
    # Improve nix store disk usage
    gc.automatic = true;
    optimise.automatic = true;

    settings = {
      auto-optimise-store = true;
      
      # Prevents impurities in builds
      sandbox = true;
      
      # Give root user and wheel group special Nix privileges.
      trusted-users = [ "root" "@wheel" ];
      allowed-users = [ "@wheel" ];
    };

    # Generally useful nix option defaults
    extraOptions = ''
      min-free = 536870912
      keep-outputs = true
      keep-derivations = true
      fallback = true
    '';
  };
}
