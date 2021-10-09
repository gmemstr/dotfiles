{ ... }: {
  imports = [
    <nixpkgs/nixos/modules/installer/sd-card/sd-image-aarch64.nix>
  ];
  # put your own configuration here, for example ssh keys:
  users.extraUsers.root.openssh.authorizedKeys.keys = [
     "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILIztwQxt+jqroFONSgq+xzPMuE2I5Dq/zWPQ8RcTYJr gabriel@gitgalaxy.com"
  ];
}
