{ cell, inputs }:
let
  inherit (inputs.std) std;
in {
    imports = [
      std.devshellProfiles.default
    ];

    config = {
      name = "java 22 shell";

      commands = [
        {
          category = "tools";
          package = inputs.nixpkgs.jdk22;
        }
      ];
    };
}
