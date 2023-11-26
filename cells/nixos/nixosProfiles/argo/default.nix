{cells, inputs}:

{

  networking.extraHosta = ''
    172.31.2.1 pve01.infra.widerstroem.com pve01
    172.31.2.2 pve02.infra.widerstroem.com pve02
    172.31.2.3 pve03.infra.widerstroem.com pve03
  '';

#  networking.firewall = {
#    allowedUDPPorts = [ 51820 ];
#  };
#
#  networking.wireguard.ingerfaces = {
#    wg0 = {
#      ips = [];
#      listenPort = ;
#      privateKeyFile  = "";
#      peers = [
#        {
#          publicKey = ;
#          allowedIPs = [];
#          endpoint = "";
#          persistentKeepalive = 15;
#        }
#      ];
#    };
#  };
}
