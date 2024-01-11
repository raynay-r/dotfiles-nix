{ inputs, ...}:

let
  inherit (inputs) nixpkgs;
in
{
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      X11Forwarding=true; # Needed for remote buid
    };
  };

  # Needed for remote build 
  environment.etc."sudo.conf" = {
    mode = "0400";
    text = "Path askpass ${nixpkgs.x11_ssh_askpass}/libexec/x11-ssh-askpass";
  };
}
