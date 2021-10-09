{ ... }: {
  imports = [
    <nixpkgs/nixos/modules/installer/sd-card/sd-image-aarch64.nix>
  ];

  services.sshd.enable = true;
  services.ntp.enable = true;
  
  users.users.gsimmer = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    password = "pass"; # This gets changed. Don't get any ideas.
    openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILIztwQxt+jqroFONSgq+xzPMuE2I5Dq/zWPQ8RcTYJr gabriel@gitgalaxy.com"];
  };
}
