{ cell, inputs }:

let
  inherit (cell) nixosProfiles;
in {
  vbox = {
    imports = with nixosProfiles; [common docker graphical ssh vbox-guest rene root];
  };

  beast = {
    imports = with nixosProfiles; [common docker graphical ssh vbox-host rene root argo libvirt];
  };
  
  tuxedo = {
    imports = with nixosProfiles; [common docker graphical ssh vbox-host rene root argo libvirt network-manager];
  };
}
