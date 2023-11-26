let
  pkgs = inputs.nixpkgs;
  unstable = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux;
  l = pkgs.lib // builtins;
in
{
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
    ''
      .openws.at
      =========
      -----BEGIN CERTIFICATE-----
      MIIDTTCCAjWgAwIBAgIIabyGuLMM4OcwDQYJKoZIhvcNAQELBQAwJjEkMCIGA1UE
      AwwbaW5ncmVzcy1vcGVyYXRvckAxNjg0NDE5MjAzMB4XDTIzMDkyNDEyMzkzNVoX
      DTI1MDkyMzEyMzkzNlowFjEUMBIGA1UEAwwLKi5vcGVud3MuYXQwggEiMA0GCSqG
      SIb3DQEBAQUAA4IBDwAwggEKAoIBAQCzbDjjK4iYN0HXL7FLeCVx9dR+TSbfOoam
      qIQ/R9bHPAdozTv9QBdhTKJzpes5LvzuepJIOmnD02LoVQMch5UM9b9KCYHMoHrh
      HtoWjFK9vaIm37AC5MISlOlUcon3yqqmd2T7C9P5IFHCuyMyU+4x+rzq3qV2VGC7
      a4s2QheiVJp7HMRqq2EvKKrDmt90hUKfQlpULr7lxcO4SmnBTEqfAjyoLd4Sxcmd
      0GJ2OKbjLniCJ8iAKeysEKrNgWXtSM+mnFyVgQu60XKu0nOfkEjWY2OJasGfOF06
      oZ89gHPTX5VdJPp3PwOOoTIG/jZWbSLCxjvzzXqW+zBemNlRk3fhAgMBAAGjgY4w
      gYswDgYDVR0PAQH/BAQDAgWgMBMGA1UdJQQMMAoGCCsGAQUFBwMBMAwGA1UdEwEB
      /wQCMAAwHQYDVR0OBBYEFGPdehCP6I5somggLXam+d7luQbTMB8GA1UdIwQYMBaA
      FNr+2x8KtpwUcpIkIRGUqtJbv/W/MBYGA1UdEQQPMA2CCyoub3BlbndzLmF0MA0G
      CSqGSIb3DQEBCwUAA4IBAQAV6UnfXyuwrmiYktp3MVsMiYn+I29wOBZCUTw0R1ui
      cK7XNB2+22ESL4YzD4ob5lPlrbiqVAc6qeDHIYEn14H6AuZ6kjxgHAdfeLSep70q
      g4OCdI5H1oiVqxU60UBv5uhAfzsFZLJfgOjSuiS0ts2E7LOsj3WYh9jxuWrxUHJP
      l/oc1CSvqNaoRafCRgRM1jUCOwLPQbpO6/PUbanOFOa54EO96Q7EQBErfsZ5fWzK
      B65u+31NZf6VqwhmEXaKiqnbr17CCtuyeljIOAMlDtOzRXGiXtV1MfH71v/7n6nv
      QLZGbYhXjIUhs0VEibpQmCkDekYnId4uxT08bJnVUy2F
      -----END CERTIFICATE-----
      -----BEGIN CERTIFICATE-----
      MIIDDDCCAfSgAwIBAgIBATANBgkqhkiG9w0BAQsFADAmMSQwIgYDVQQDDBtpbmdy
      ZXNzLW9wZXJhdG9yQDE2ODQ0MTkyMDMwHhcNMjMwNTE4MTQxMzIyWhcNMjUwNTE3
      MTQxMzIzWjAmMSQwIgYDVQQDDBtpbmdyZXNzLW9wZXJhdG9yQDE2ODQ0MTkyMDMw
      ggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDIBiVB2QwrMMux/liPI7wI
      7UVnVN08RYPQaIFKkByAHJS+lKgF/JiITNfCfwQ2Z9pBxK4KO8FEZXCYoOQBoBUj
      COC5JxyJBaiQD8MZx+oD6KmVu/9LjO2l1b/AVF6Y5QB3ka9l2/Szmh2PBJaX54uq
      sy6WfSJElSs9JcVBumM5UUcNxMmSSkfsYX/wqmTII42xFg9ljSL1a5pGUKmaBYcw
      Lkgz+HQCUmdthJtF1bKCTRFpZTqqJrOWfI7Y7eOChOS6NhOZboJHfwPUjNLpcmTW
      2Se//TQfB6/+CKM1QboISyRvUsOpvX4BLo6FzHr/0R2A8begLdvI67ZEShB5nmSb
      AgMBAAGjRTBDMA4GA1UdDwEB/wQEAwICpDASBgNVHRMBAf8ECDAGAQH/AgEAMB0G
      A1UdDgQWBBTa/tsfCracFHKSJCERlKrSW7/1vzANBgkqhkiG9w0BAQsFAAOCAQEA
      QvB1rSProQcuV1k337oSAGBxkDHqDTbssbqyl6Ds5fteRYCAbbmFCeoHSAuUU1ei
      CA4fskIOmkWco6Y53QB5nAPhzuGDkXXixtz0WgPhZjuPb8T3DgnOu9ddvL9L1EoY
      2mobepJ90kzwZJA1mtUy1fNdP7Lbasr/LOcLhK1hVxT2NzH/rYLlqul5Ac2A5Hom
      Iij0FyEoLmKQysIt4mA0ewztoJXZ1fzsUo1cfM9bwmPCltXOIIAvGh/nLNP5WqwE
      ae9g0U6pEsefvifF/sFXRNwRFzfqFcxs1eytUKjs5IyIPaUJ8S29vZh3RS1wv8WP
      ewJnbWsqlkE0Eli3TVpTvg==
      -----END CERTIFICATE-----
    ''
    ''
      -----BEGIN CERTIFICATE-----
      MIIC1DCCAbwCFH0JS5/shTNvfaeXdiFLbB/q9CgkMA0GCSqGSIb3DQEBCwUAMCYx
      JDAiBgNVBAMMG2luZ3Jlc3Mtb3BlcmF0b3JAMTY4NDQxOTIwMzAeFw0yMzA5MjMy
      MDQ1MThaFw0zMzA5MjAyMDQ1MThaMCcxDzANBgNVBAoMBk9wZW5XUzEUMBIGA1UE
      AwwLKi5vcGVud3MuYXQwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDb
      4ksGGrsca4I339eW1VynEr0AsiFyFPjPGkSEDWvx8GM+mETtbBLnoywL9K8PQdrH
      X/mqyUE7GifIG+DyNLy+uuG1LY/7STr+zFsTwqu4CIuMt6EusEMoqk1aG0Z7tSn/
      2YApONJ1K4ppF22F/QFX3xkBhDZqjYc49vmFVOVNGUKDpM6zUDXOwbD1BR/PMbYo
      1SHxj+v5stvqVo5qtgjVJCEDD66LxUuroGLPW1+9rjO5QaHeL1UpUbSQSG5wuJSc
      v96kAVNOjog8921QkjFOOvap16uOh8mZSAENmu+suYGm6thEEh2HPmCqkzUTHyzM
      +XwJ+6jV97qBzBaYgyKNAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAC6YYSYKaHGf
      ZkVp9lEALnSvR0+oTPUigk+QYllOObOQIn6pjNMmcq/Xv/087t6RBMNoymoQPzIC
      hIKUOgLOO/j0ijcNpBV/e5m9E9wOmHqF3zJbpBE0NA3UqU9qmnK+9XWDOjYJaZG5
      I/MM6XpOSyr3Rfv1hKAhTlpZc/AXnbiRa+/L/v2OUh6GHZ6pyC5ZcsvCM2QSsg18
      awO9K1Dhnem9oeHYr0136Tzn1L2X2Tz20XG7yXe1v+WgITnultTXA3hNML0skoUr
      czZFduULk0QuELcYMiD9Fbd9VTIaGcEx1t5lq0ZUYxtph0OJuC10aqf/OJ7p+0dj
      Kp1+6myr+9Q=
      -----END CERTIFICATE-----
    ''
    ''
      -----BEGIN CERTIFICATE-----
      MIIDDDCCAfSgAwIBAgIBATANBgkqhkiG9w0BAQsFADAmMSQwIgYDVQQDDBtpbmdy
      ZXNzLW9wZXJhdG9yQDE2ODQ0MTkyMDMwHhcNMjMwNTE4MTQxMzIyWhcNMjUwNTE3
      MTQxMzIzWjAmMSQwIgYDVQQDDBtpbmdyZXNzLW9wZXJhdG9yQDE2ODQ0MTkyMDMw
      ggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDIBiVB2QwrMMux/liPI7wI
      7UVnVN08RYPQaIFKkByAHJS+lKgF/JiITNfCfwQ2Z9pBxK4KO8FEZXCYoOQBoBUj
      COC5JxyJBaiQD8MZx+oD6KmVu/9LjO2l1b/AVF6Y5QB3ka9l2/Szmh2PBJaX54uq
      sy6WfSJElSs9JcVBumM5UUcNxMmSSkfsYX/wqmTII42xFg9ljSL1a5pGUKmaBYcw
      Lkgz+HQCUmdthJtF1bKCTRFpZTqqJrOWfI7Y7eOChOS6NhOZboJHfwPUjNLpcmTW
      2Se//TQfB6/+CKM1QboISyRvUsOpvX4BLo6FzHr/0R2A8begLdvI67ZEShB5nmSb
      AgMBAAGjRTBDMA4GA1UdDwEB/wQEAwICpDASBgNVHRMBAf8ECDAGAQH/AgEAMB0G
      A1UdDgQWBBTa/tsfCracFHKSJCERlKrSW7/1vzANBgkqhkiG9w0BAQsFAAOCAQEA
      QvB1rSProQcuV1k337oSAGBxkDHqDTbssbqyl6Ds5fteRYCAbbmFCeoHSAuUU1ei
      CA4fskIOmkWco6Y53QB5nAPhzuGDkXXixtz0WgPhZjuPb8T3DgnOu9ddvL9L1EoY
      2mobepJ90kzwZJA1mtUy1fNdP7Lbasr/LOcLhK1hVxT2NzH/rYLlqul5Ac2A5Hom
      Iij0FyEoLmKQysIt4mA0ewztoJXZ1fzsUo1cfM9bwmPCltXOIIAvGh/nLNP5WqwE
      ae9g0U6pEsefvifF/sFXRNwRFzfqFcxs1eytUKjs5IyIPaUJ8S29vZh3RS1wv8WP
      ewJnbWsqlkE0Eli3TVpTvg==
      -----END CERTIFICATE-----
    ''
    ''
      -----BEGIN CERTIFICATE-----
      MIIF0zCCBLugAwIBAgIUcynQWVju3cpxgSjD243sppnb/oIwDQYJKoZIhvcNAQEL
      BQAwgbwxCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJVUzELMAkGA1UEBxMCVVMxDzAN
      BgNVBAoTBk9wZW5XUzEkMCIGA1UECxMbVW5pdmVudGlvbiBDb3Jwb3JhdGUgU2Vy
      dmVyMTowOAYDVQQDEzFVbml2ZW50aW9uIENvcnBvcmF0ZSBTZXJ2ZXIgUm9vdCBD
      QSAoSUQ9clVNbmxKU20pMSAwHgYJKoZIhvcNAQkBFhFzc2xAdm1zLm9wZW53cy5h
      dDAeFw0yMzA5MjQxNTI4MjlaFw0yODA5MjIxNTI4MjlaMIG8MQswCQYDVQQGEwJV
      UzELMAkGA1UECBMCVVMxCzAJBgNVBAcTAlVTMQ8wDQYDVQQKEwZPcGVuV1MxJDAi
      BgNVBAsTG1VuaXZlbnRpb24gQ29ycG9yYXRlIFNlcnZlcjE6MDgGA1UEAxMxVW5p
      dmVudGlvbiBDb3Jwb3JhdGUgU2VydmVyIFJvb3QgQ0EgKElEPXJVTW5sSlNtKTEg
      MB4GCSqGSIb3DQEJARYRc3NsQHZtcy5vcGVud3MuYXQwggEiMA0GCSqGSIb3DQEB
      AQUAA4IBDwAwggEKAoIBAQDAUYCfb9raTrPGTA3KkScJ7hXnwg5OLhrvGHVXF9I+
      wkm9sHgUAhxpeSVrXp6S791D/YPfd0eOCOyQFfz0uJiS7D1YPRH/ps6lWLTr39uN
      ujnMfRWeTWYB8MjIZYcGKzlIrn/Nx5y/OI9c3vidFTxjqqASZ7zHSlpNq3rmdVra
      4EELXOZyOO2SpyL9BxB8gsI0dmGuEOAnk28d2VVLET+xAHghUvLwFVa8KYe/Ho7Y
      W3laVIAmJe+5SZLINbl0qZVJW0Mwt1ngeiBilEI6D8NwsgbCMZyJ1HMXpNW99ZkW
      ygtSv16hy7Y8Q9l1utZqyj3oVM0KhIDhNn3vyeewXqzHAgMBAAGjggHJMIIBxTAP
      BgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBTE4psIVBL+XZTenT1NoDSMpoDOUzCB
      /AYDVR0jBIH0MIHxgBTE4psIVBL+XZTenT1NoDSMpoDOU6GBwqSBvzCBvDELMAkG
      A1UEBhMCVVMxCzAJBgNVBAgTAlVTMQswCQYDVQQHEwJVUzEPMA0GA1UEChMGT3Bl
      bldTMSQwIgYDVQQLExtVbml2ZW50aW9uIENvcnBvcmF0ZSBTZXJ2ZXIxOjA4BgNV
      BAMTMVVuaXZlbnRpb24gQ29ycG9yYXRlIFNlcnZlciBSb290IENBIChJRD1yVU1u
      bEpTbSkxIDAeBgkqhkiG9w0BCQEWEXNzbEB2bXMub3BlbndzLmF0ghRzKdBZWO7d
      ynGBKMPbjeymmdv+gjALBgNVHQ8EBAMCAQYwEQYJYIZIAYb4QgEBBAQDAgAHMBwG
      A1UdEQQVMBOBEXNzbEB2bXMub3BlbndzLmF0MBwGA1UdEgQVMBOBEXNzbEB2bXMu
      b3BlbndzLmF0MDgGCWCGSAGG+EIBDQQrFilUaGlzIGNlcnRpZmljYXRlIGlzIGEg
      Um9vdCBDQSBDZXJ0aWZpY2F0ZTANBgkqhkiG9w0BAQsFAAOCAQEAL5Ify7nGXePm
      jZCENA8mK+d9rLxzyc8tiai7gOWKigTYkv4mre2HK+EPDZTY0l2A7KJ+gRpNZ1ig
      v4L0YkEOaX4zuDJdk71lm7z2VifvWKmf5qgrCHbjl12DuTxPfDJrzi5i8jI3XZ10
      Us4/DLak68RUR75jH3oFoYG6kKqG+5ixzAqf4VZigYizPfhT5OBeNU1uGzorYljC
      Wf/dKpN7f6oIo8eYrSRw9u192IIycrOozpMrUpLnf1kzuCYLxUbgkpGKjlz7pMFv
      esz7Zsuxm+mkFY79Tnkm+eD6YfWckCSacpm0B62KGXCbfpSCvKxaZqQVjv9ItbKb
      bH3RBQqOLw==
      -----END CERTIFICATE-----
    ''
    ''
      -----BEGIN CERTIFICATE-----
      MIIC1DCCAbwCFH0JS5/shTNvfaeXdiFLbB/q9CgkMA0GCSqGSIb3DQEBCwUAMCYx
      JDAiBgNVBAMMG2luZ3Jlc3Mtb3BlcmF0b3JAMTY4NDQxOTIwMzAeFw0yMzA5MjMy
      MDQ1MThaFw0zMzA5MjAyMDQ1MThaMCcxDzANBgNVBAoMBk9wZW5XUzEUMBIGA1UE
      AwwLKi5vcGVud3MuYXQwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDb
      4ksGGrsca4I339eW1VynEr0AsiFyFPjPGkSEDWvx8GM+mETtbBLnoywL9K8PQdrH
      X/mqyUE7GifIG+DyNLy+uuG1LY/7STr+zFsTwqu4CIuMt6EusEMoqk1aG0Z7tSn/
      2YApONJ1K4ppF22F/QFX3xkBhDZqjYc49vmFVOVNGUKDpM6zUDXOwbD1BR/PMbYo
      1SHxj+v5stvqVo5qtgjVJCEDD66LxUuroGLPW1+9rjO5QaHeL1UpUbSQSG5wuJSc
      v96kAVNOjog8921QkjFOOvap16uOh8mZSAENmu+suYGm6thEEh2HPmCqkzUTHyzM
      +XwJ+6jV97qBzBaYgyKNAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAC6YYSYKaHGf
      ZkVp9lEALnSvR0+oTPUigk+QYllOObOQIn6pjNMmcq/Xv/087t6RBMNoymoQPzIC
      hIKUOgLOO/j0ijcNpBV/e5m9E9wOmHqF3zJbpBE0NA3UqU9qmnK+9XWDOjYJaZG5
      I/MM6XpOSyr3Rfv1hKAhTlpZc/AXnbiRa+/L/v2OUh6GHZ6pyC5ZcsvCM2QSsg18
      awO9K1Dhnem9oeHYr0136Tzn1L2X2Tz20XG7yXe1v+WgITnultTXA3hNML0skoUr
      czZFduULk0QuELcYMiD9Fbd9VTIaGcEx1t5lq0ZUYxtph0OJuC10aqf/OJ7p+0dj
      Kp1+6myr+9Q=
      -----END CERTIFICATE-----
    ''
  ];

  environment = {
    systemPackages = (with pkgs; [
      wget
      curl
      git
      tmux
      unzip
      bat
      exa
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
      pandoc
      gnupg
      pinentry-curses
      jq
      tldr
      cht-sh
      crc
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

  fonts.fonts = with pkgs; [ nerdfonts ];

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
