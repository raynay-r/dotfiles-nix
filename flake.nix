{
  description = "The Endgame";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/release-24.05";
    };

    nixpkgs-unstable = {
      url = "github:nixos/nixpkgs/nixpkgs-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    devshell = {
      url = "github:numtide/devshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    std,
    hive,
    nixos-wsl,
    nixpkgs-unstable,
    self,
    ...
  } @ inputs:
    hive.growOn {
      inherit inputs;

      nixpkgsConfig = {
        allowUnfree = true;
        permittedInsecurePackages = [ 
          "openssl-1.1.1w"
        ];
      };

      systems = [
        "x86_64-linux"
      ];

      cellsFrom = ./cells;

      cellBlocks = 
        with std.blockTypes;
        with hive.blockTypes; [
          # modules implement
          (functions "nixosModules")
          (functions "homeModules")
          (functions "devshellModules")

          # profiles activate
          (functions "hardwareProfiles")
          (functions "nixosProfiles")
          (functions "homeProfiles")
          (functions "devshellProfiles")

          # suites aggregate profiles 
          (functions "nixosSuites")
          (functions "homeSuites")

          # configurations can be deployed
          nixosConfigurations
          homeConfigurations

          # devshells can be entered
          (devshells "devshells")
        ];
    }
    # soil
    {
      devShells = std.harvest self ["shells" "devshells"];
      homeModules = hive.pick inputs.self [
        ["home" "homeModules"]
        ["home" "homeProfiles"]
        ["home" "homeSuites"]
        ["home" "homeConfigurations"]
      ];
    }
    {
      nixosConfigurations = hive.collect self "nixosConfigurations";
      homeConfigurations = hive.collect self "homeConfigurations";
    };
}
