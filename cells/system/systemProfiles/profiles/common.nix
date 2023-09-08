let
  l = nixpkgs.lib // builtins
in
{
  # Sets nrdxp.cachix.org binary cache which just speeds up some builds
  imports = [ ../cachix ];

  time.timeZone = "Europe/Vienna";

  security.pki.certificates = [
    ''
      .home
      =========
      -----BEGIN CERTIFICATE-----
      MIID+zCCAuOgAwIBAgIDW6WYMA0GCSqGSIb3DQEBCwUAMG0xDzANBgNVBAMMBiou
      aG9tZTELMAkGA1UEBhMCQVQxDzANBgNVBAgMBlZpZW5uYTEPMA0GA1UEBwwGVmll
      bm5hMQ0wCwYDVQQKDARIT01FMRwwGgYJKoZIhvcNAQkBFg1hZG1pbkBtZS5ob21l
      MB4XDTIyMDUwODA4NTk1NloXDTMyMDUwNTA4NTk1NlowbTEPMA0GA1UEAwwGKi5o
      b21lMQswCQYDVQQGEwJBVDEPMA0GA1UECAwGVmllbm5hMQ8wDQYDVQQHDAZWaWVu
      bmExDTALBgNVBAoMBEhPTUUxHDAaBgkqhkiG9w0BCQEWDWFkbWluQG1lLmhvbWUw
      ggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDGpln8u2SCWN6jNL0/qpQx
      +ToEc3jERoG0U/mYrImU9i+/N3OFCh/C7WI1LkXVmBzRuzICShmK2BjRzEiJl1CZ
      pia2g12HEbtV23hc3w9DRTU2+MUh3mF4UZNQToRlMjO5zAfy8BkGf101bmXPM8tE
      CGUJ/8es3TvtFaXv50uAGBZ8zOHuGUBEtKyHHheP+YIdqT6nZvzca3BxwQyvtjvF
      xKCRZP338peC5THaerSURlTszCGhx3iMG5OWdkmM/C7U2ACidS7jyzNQ+f7KgTud
      MUlIT0NJiGlnXrdjpmWve3kP06xZwAvMjPyaPJ+iyfcJRd9Pocmts9qY0Fa95HyN
      AgMBAAGjgaMwgaAwEQYDVR0RBAowCIIGKi5ob21lMB0GA1UdDgQWBBThty/jXPYP
      e1ysYlANgIt2F4NIQzAPBgNVHRMBAf8EBTADAQH/MEsGA1UdJQREMEIGBFUdJQAG
      CCsGAQUFBwMCBggrBgEFBQcDAwYIKwYBBQUHAwQGCCsGAQUFBwMJBggrBgEFBQcD
      AQYIKwYBBQUHAwgwDgYDVR0PAQH/BAQDAgEGMA0GCSqGSIb3DQEBCwUAA4IBAQCL
      8tUTo59I2BOY5DUqT0CrhKmeuw/OGqHzXD7fIwnv1oGA6cMI0ZAZxZHfgLYoaExO
      pUT72s2tZAimF7waJ08Wy7Q66Fl+/8ZjlYB+NG+0KNQxxHJjB2/RleXnnEZr1qpx
      TBG8M4E3NylRnf6YfXdOJg6oGHTte+c46RcrBsPt88BJPZQUvMcTQWqY04r+4tmt
      FCPIJ8N8icFQ9fWZOhepLFffWwgY16TnVMK8Tbcydm0P5lCwv+bQlMi016r9MF7l
      jXxaMTs2kRlpWehEe39qj9yHWfvgN5oCnwDbigQGlgER1WIGcAZi1qlMzuzDs4JC
      uVHV548VcA9Xwp1txyt/
      -----END CERTIFICATE-----
    ''
  ];

  environment = {
    systemPackages = with pkgs; [
      wget
      curl
      git
      tmux
      unzip
      bat
      exa
      lazygit
      ripgrep
      fd
      kubectl
      k9s
      kubernetes-helm
      openshift
      kubeseal
      pandoc
      gnupg
      pinentry-curses
      jq
    ];

    variables = {
      EDITOR = "vim";
    };

    shells = with pkgs; [ zsh ];
  };

  fonts.fonts = with pkgs; [ nerdfonts ];

  programs.zsh = {
    enable = true;
    promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";

    shellInit = ''
      zsh-newuser-install() { :; }

      ${l.fileContents ./p10k.zsh}

      eval "$(direnv hook zsh)"
    '';

    shellAliases = {
      home = "cd";
    };

    ohMyZsh = {
      enable = true;
    };
  };

  services.pcscd.enable = true;
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
    autoOptimiseStore = true;
    optimise.automatic = true;

    # Prevents impurities in builds
    useSandbox = true;

    # Give root user and wheel group special Nix privileges.
    trustedUsers = [ "root" "@wheel" ];
    allowedUsers = [ "@wheel" ];

    # Generally useful nix option defaults
    extraOptions = ''
      min-free = 536870912
      keep-outputs = true
      keep-derivations = true
      fallback = true
    '';
  };
}
