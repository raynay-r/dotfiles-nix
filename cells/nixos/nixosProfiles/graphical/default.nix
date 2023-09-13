let
  inherit (inputs) nixpkgs;
in {
  sound.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.xserver = {
    enable = true;
    layout = "us";

    windowManager.i3 = {
      enable = true;
      #package = pkgs.i3-gaps;
    };
  };

  services.picom = {
    enable = true;
    #vSync = true;
  };

  environment = {
    systemPackages = with nixpkgs; [
      brave
      firefox
      feh
      imagemagick
      lxde.lxrandr
      lxappearance
      maim
      xclip
      betterlockscreen
      pavucontrol
      dracula-theme
      vlc
    ];
  };

  #fonts.fonts = with pkgs; [ roboto ];

  fonts.fontconfig.defaultFonts = {
    monospace = [ "UbuntuMono Nerd Font Mono" ];
    #sansSerif = [ "Roboto" ];
  };
}
