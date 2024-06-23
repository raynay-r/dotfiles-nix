{ cell, inputs, ...}:

let 
  inherit (cell) homeSuites;
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
  
  tuxedo = {
    imports = [ 
      homeSuites.rene
    ];
  };

  tuxedo-wsl = {
    imports = [
      homeSuites.rene-wsl
    ];
  };
}
