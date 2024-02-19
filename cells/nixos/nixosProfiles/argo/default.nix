{cell, inputs, ...}:
let 
  pkgs = inputs.nixpkgs;
  unstable = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux;
  lib = inputs.nixpkgs.lib;
in
{
  networking.extraHosts = ''
    172.31.2.1 pve01
    172.31.2.2 pve02
    172.31.2.3 pve03
  '';

  security.pki.certificateFiles = lib.filesystem.listFilesRecursive ./_certs;
  #security.pki.certificateFiles = [
  #   (./. + "/_certs/brzCAs/Produktive BRZ CA - P/Generation01/BRZPersonLevel2CA201.cacert.crt")
  #];

  environment = {
    systemPackages = with pkgs; [
      openconnect
      gnutls
    ];

    etc = {
      "pkcs11/modules/etoken.module".text = ''
        module: ${pkgs.pcsc-safenet}/lib/libeTPkcs11.so
      '';
    };
  };

  systemd.services.projects = {
    after = [
      "network.target"
    ];
    wantedBy = [
      "multi-user.target"
    ];

    serviceConfig = {
      Type = "simple";
      User = "rene";
      ExecStart = "${pkgs.openssh}/bin/ssh -N -D 9191 root@84.242.14.118";
      RestartSec = 5;
      Restart = "always";
    };
  };

  systemd.services.bundesclient = {
    after = [
      "network.target"
    ];
    wantedBy = [
      "multi-user.target"
    ];

    serviceConfig = {
      Type = "simple";
      User = "rene";
      ExecStart = "${pkgs.openssh}/bin/ssh -N -D 9292 -J root@84.242.14.118 root@10.0.8.1";
      RestartSec = 5;
      Restart = "always";
    };
  };

  systemd.services.openforge = {
    after = [
      "network.target"
    ];
    wantedBy = [
      "multi-user.target"
    ];

    serviceConfig = {
      Type = "simple";
      User = "rene";
      ExecStart = "${pkgs.openssh}/bin/ssh -N -D 9393 root@84.242.14.116";
      RestartSec = 5;
      Restart = "always";
    };
  };

  systemd.services.openws = {
    after = [
      "network.target"
    ];
    wantedBy = [
      "multi-user.target"
    ];

    serviceConfig = {
      Type = "simple";
      User = "rene";
      ExecStart = "${pkgs.openssh}/bin/ssh -N -D 9494 -J root@84.242.14.118 root@10.0.19.1";
      RestartSec = 5;
      Restart = "always";
    };
  };
  
  systemd.services.proxmox = {
    after = [
      "network.target"
    ];
    wantedBy = [
      "multi-user.target"
    ];

    serviceConfig = {
      Type = "simple";
      User = "rene";
      ExecStart = "${pkgs.openssh}/bin/ssh -N -D 9595 root@83.137.118.81";
      RestartSec = 5;
      Restart = "always";
    };
  };
  

  #networking.wg-quick.interfaces = {
  #  wg0 = {
  #    address = [
  #      "172.31.100.6"
  #    ];
  #    
  #    privateKeyFile  = "/home/rene/.wg/datacenter.key";
  #    peers = [
  #      {
  #        publicKey = "Y0wYYzaKdZYd8Vdc6yrWf6tIcPfzqiYMRriTVhp6pyU=";
  #        presharedKeyFile = "/home/rene/.wg/datacenter_preshared.key";
  #        allowedIPs = [
  #          "172.31.100.1/32"
  #          "172.31.1.11/32"
  #          "172.31.1.12/32"
  #          "172.31.1.13/32"
  #          "172.31.2.1/32"
  #          "172.31.2.2/32"
  #          "172.31.2.3/32"
  #        ];
  #        endpoint = "wg.argo.coop:51820";
  #        persistentKeepalive = 25;
  #      }
  #    ];
  #  };
  #};
}
