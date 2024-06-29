{ cell, inputs }:
let
  inherit (inputs.std) std;
in {
    imports = [
      std.devshellProfiles.default
    ];

    config = {
      name = "go shell";

      commands = [
        {
          category = "tools";
          package = inputs.nixpkgs.go;
        }
      ];
    };
}
