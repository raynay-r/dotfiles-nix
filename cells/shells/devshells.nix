{ cell, inputs, ... }:
let
  inherit (inputs.std) lib;
in
builtins.mapAttrs (_: lib.dev.mkShell) {
  default = {
    imports = [
      cell.devshellProfiles.go
    ];
  };
  java = {
    imports = [
      cell.devshellProfiles.java
    ];
  };
}
