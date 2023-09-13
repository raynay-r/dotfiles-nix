let 
  inherit (cell) homeSuites;
  inherit (inputs) home-manager;
in {
  vbox = {
    bee = {
      home = home-manager;
      system = "x86_64-linux";
      pkgs = inputs.nixpkgs;
    };

    imports = [ 
      homeSuites.rene
    ];
  };
}
