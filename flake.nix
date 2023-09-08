{
  description = "The Endgame";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/release-23.05";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    devshell = {
      url = "github:numtide/devshell";
      inputs.nixpkgs.follows = "nixpkgs";
    }

    std = {
      url = "github:divnix/std";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        devshell.follows = "devshell";
      };
    };

    hive = {
      url = "github:divnix/hive";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    std,
    nixpkgs,
    ...
  } @ inputs:
    std.growOn {
      inherit inputs;

      nixpkgsConfig = {
        allowUnfree = true;
      };

      systems = [
        "x86_64-linux"
      ];

      cellsFrom = ./cells;

      cellBlocks = 
        with std.blockTypes;
        with hive.blockTypes; [
          # modules implement
          (functions "systemModules")
          (functions "homeModules")

          # profiles activate
          (functions "systemProfiles")
          (functions "homeProfiles")
        ];
    }

    {

    };

    {
    };
};
