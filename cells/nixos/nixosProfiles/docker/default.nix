{
  virtualisation.docker = {
    enable = true;
    daemon.settings = {
      insecure-registries = [ 
        "git.apps.projects.infra.widerstroem.com" 
      ];
    };
  };
  

  #systemd.services.docker = {
  #  environment = {
  #    HTTP_PROXY = "socks5://127.0.0.1:9191";
  #    HTTPS_PROXY = "socks5://127.0.0.1:9191";
  #  };
  #};
}
