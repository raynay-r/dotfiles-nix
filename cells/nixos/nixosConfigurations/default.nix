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
    ];
  };
}
