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
    };
  };

  services.picom = {
    enable = true;
    vSync = true;
  };

  environment = {
    systemPackages = with nixpkgs; [
      brave
      firefox
      thunderbird
      nextcloud-client
      feh
      imagemagick
      lxde.lxrandr
      lxappearance
      maim
      xclip
      betterlockscreen
      pavucontrol
      catppuccin-gtk
      vlc
      libreoffice
      hunspell
      hunspellDicts.de_AT
      hunspellDicts.en_US
      zathura
      pinentry-gtk2
      logseq
      element-desktop
      drawio
      whatsapp-for-linux
    ];
  };
  #fonts.fonts = with pkgs; [ roboto ];

  fonts.fontconfig.defaultFonts = {
    monospace = [ "UbuntuMono Nerd Font Mono" ];
    sansSerif = [ "Ubuntu Nerd Font" ];
  };
}
