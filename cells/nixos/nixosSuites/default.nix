let
  inherit (cell) nixosProfiles;
in {
  vbox = {
    imports = with cell.nixosProfiles; [common docker graphical ssh vbox-guest rene];
  };
}
