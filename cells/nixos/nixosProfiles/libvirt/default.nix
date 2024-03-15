{inputs, ...}:

let
  pkgs = inputs.nixpkgs;
in {
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf = {
          enable = true;
          packages = [(pkgs.OVMFFull.override {
            secureBoot = true;
            tpmSupport = true;
          }).fd];
        };
      };
    };
  };

  programs.dconf.enable = true;
  environment.systemPackages = with pkgs; [ 
    virt-manager 
  ];
}
