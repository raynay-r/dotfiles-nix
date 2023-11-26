{inputs, ...}:

let
  pkgs = inputs.nixpkgs;
in {
  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;
  environment.systemPackages = with pkgs; [ virt-manager ];
}
