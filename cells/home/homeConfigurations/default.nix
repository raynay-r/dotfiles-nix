let 
  inherit (cell) homeSuites;
  inherit (inputs) home-manager;
in {
  vbox = {
    imports = [ 
      homeSuites.rene
    ];
  };
  
  beast = {
    imports = [ 
      homeSuites.rene
    ];
  };
}
