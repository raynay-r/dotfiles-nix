{
  users.extraGroups.vboxusers = {
    members = [ "rene" ];
  };

  virtualisation = {
    virtualbox.host = {
      enable = true;
      enableExtensionPack = true;
    };
    
    libvirtd = {
      enable = true;
    };
  };
}
