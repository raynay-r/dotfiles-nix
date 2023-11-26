{
  description = "The Endgame";

  inputs = {
    #nixos-23-05.url = "github:nixos/nixpkgs/release-23.05";
    #home-23-05.url = "github:nix-community/home-manager/release-23.05";
    
    #nixos.follows = "nixos-23-05";
    #home.follows = "home-23-05";

    nixpkgs = {
      url = "github:nixos/nixpkgs/release-23.05";
    };

    nixpkgs-unstable = {
      url = "github:nixos/nixpkgs/nixpkgs-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
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

    language-servers = {
      url = "git+https://git.sr.ht/~bwolf/language-servers.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    std,
    hive,
    nixpkgs-unstable,
    language-servers,
    self,
    ...
  } @ inputs:
    hive.growOn {
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
          (devshells "shells")
        ];
    }
    # soil
    {
      devShells = std.harvest self ["shells"];
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
