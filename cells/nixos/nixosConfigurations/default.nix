{ cell, inputs, ...}:

let 
  inherit (cell) nixosSuites;
  inherit (inputs.cells.hosts) hardwareProfiles; 
  inherit (inputs.cells.home) homeConfigurations; 
in {
  vbox = {
    config,
    options,
    pkgs,
    ...
  }: {
    bee.system = "x86_64-linux";
    bee.home = inputs.home-manager;
    bee.pkgs = import inputs.nixpkgs {
      inherit (inputs.nixpkgs) system;
      config.allowUnfree = true;
      overlays = [];
    };

    imports = [
      nixosSuites.vbox 
      hardwareProfiles.vbox
      {home-manager.users.rene = homeConfigurations.vbox;}
    ];
  };

  beast = {
    config,
    options,
    pkgs,
    ...
  }: {
    bee.system = "x86_64-linux";
    bee.home = inputs.home-manager;
    bee.pkgs = import inputs.nixpkgs {
      inherit (inputs.nixpkgs) system;
      config.allowUnfree = true;
      config.permittedInsecurePackages = [ 
        "openssl-1.1.1w"
      ];
      overlays = [];
    };

    imports = [
      nixosSuites.beast
      hardwareProfiles.beast
      {home-manager.users.rene = homeConfigurations.beast;}
    ];
  };
  
  tuxedo = {
    config,
    options,
    pkgs,
    ...
  }: {
    bee.system = "x86_64-linux";
    bee.home = inputs.home-manager;
    bee.pkgs = import inputs.nixpkgs {
      inherit (inputs.nixpkgs) system;
      config.allowUnfree = true;
      config.permittedInsecurePackages = [ 
        "openssl-1.1.1w"
      ];
      overlays = [];
    };

    imports = [
      nixosSuites.tuxedo
      hardwareProfiles.tuxedo
      {home-manager.users.rene = homeConfigurations.tuxedo;}
    ];
  };

  tuxedo-wsl = {
    config,
    options,
    pkgs,
    ...
  }: {
    bee.system = "x86_64-linux";
    bee.home = inputs.home-manager;
    bee.wsl = inputs.nixos-wsl;
    bee.pkgs = import inputs.nixpkgs {
      inherit (inputs.nixpkgs) system;
      config.allowUnfree = true;
      config.permittedInsecurePackages = [ 
        "openssl-1.1.1w"
      ];
      overlays = [];
    };

    wsl.defaultUser = "rene";

    imports = [
      nixosSuites.tuxedo-wsl
      {home-manager.users.rene = homeConfigurations.tuxedo-wsl;}
    ];
  };
}
