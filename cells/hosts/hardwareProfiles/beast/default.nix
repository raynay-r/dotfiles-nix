let
  inherit (inputs) nixpkgs;
  inherit (inputs.nixpkgs) lib;
in {
  imports = [ 
    #(modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/75505e9c-3266-4f62-9847-34bcb9f5c00e";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/3623-763E";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/b431f324-b285-48c6-b957-e6e8996b158e"; }
    ];

  networking.useDHCP = lib.mkDefault true;

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  #hardware.video.hidpi.enable = lib.mkDefault true;

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };
    grub = {
      enable = true;
      efiSupport = true;
      useOSProber = true;
      device = "nodev";
    };
  };

  services.xserver.videoDrivers = [ "nvidia" ];
  services.xserver.dpi = 192;

  environment.variables = {
    GDK_SCALE = "1";
    GDK_DPI_SCALE = "0.5";
    _JAVA_OPTIONS = "-Dsun.java2d.uiScale=2";
  };

  services.printing = {
    enable = true;
    drivers = [ nixpkgs.hplip ];
  };

  #services.xserver.displayManager.setupCommands = ''
  #  ${nixpkgs.xorg.xrandr}/bin/xrandr --dpi 192 --output DP-2 --mode 3840x2160 --pos 3840x0 --rotate normal --output DP-4 --mode 3840x2160 --pos 0x0 --rotate normal --output DP-0 --mode 3840x2160 --pos 7680x0 --rotate normal
  #'';
}
