{ cell, inputs, ... }:
let
  inherit (inputs.std) lib std;
in
builtins.mapAttrs (_: lib.dev.mkShell) {
  default = {
    name = "go shell";

    imports = [
      std.devshellProfiles.default
    ];

    commands = [
      {
        category = "tools";
        package = inputs.nixpkgs.go;
      }
    ];
  };
  java = {
    name = "java shell";

    imports = [
      std.devshellProfiles.default
    ];

    commands = [
      {
        category = "tools";
        package = inputs.nixpkgs.jdk22;
      }
    ];
  };
}
