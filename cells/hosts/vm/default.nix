{ config, lib, pkgs, suites, ... }:

{
  imports = suites.vbox ++ [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  services.xserver.videoDrivers = [ "vmsvga" ];
}
