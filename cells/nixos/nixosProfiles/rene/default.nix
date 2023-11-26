{
  users = {
    users.rene = {
      uid = 1000;
      description = "Rene Raab";
      isNormalUser = true;
      home = "/home/rene";
      extraGroups = [ "wheel" "docker" "libvirtd" ];
      hashedPassword = "$6$2lHCOYpJ6DpAx68v$o8ygenNQ75iW3MhI7YZCpEg6SvixeXQjXdvRLfcqTzqP7DVhoG0XHfOgpS0e82N84.JqztuRurjglIlHw4I8C0";
      openssh.authorizedKeys.keys = [
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDErLWFTAH7LKvhlltJ3pDytSFW4jNhjhlk74m6zSck4cNFiROlmNhAYTL3zi5a4/rr0k3/uepA7stL87Z7VJJsUsGKfTNOj4nvlpEqt5tCxr4AJ3fL5ATxsxokO4HtpkOJDj3mN/Qc9JzEKMhMa5NzNB48Eckny4VtvhOt8JtvgoClipAzlfx7JUmcx7nkgMj3Bc7RJM9bfupj46pn9Ahb8gtO251mIZWu5LdfdEE781GBL4TzcothvNAtG4Dw3VUsH5e7lOHcZb1rOKhU3bxGqcDvhavR9jMWPBXvgWN6tdt70/NBDUPLJjs4nEmtVJG5tZK7QLUM1kzRjnlTyRbD rene@beast"
      ];  
    };

    groups.rene = {
      gid = 1000;
    };
  };
}
