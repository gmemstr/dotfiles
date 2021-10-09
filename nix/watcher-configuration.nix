{ config, pkgs, lib, ... }: {

  boot.loader.grub.enable = false;
  boot.loader.generic-extlinux-compatible.enable = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

    
  services.sshd.enable = true;
  services.ntp.enable = true;
  
  users.users.gsimmer = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    password = "pass"; # This gets changed. Don't get any ideas.
    openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILIztwQxt+jqroFONSgq+xzPMuE2I5Dq/zWPQ8RcTYJr gabriel@gitgalaxy.com"];
  };
  
  environment.systemPackages = [ pkgs.git pkgs.curl ];

  systemd.user.services.ensure-curlscript = {
    script = ''
      # At some point this will pull down a more complete script.
      echo "Done!"
    '';
    wantedBy = [ "multi-user.target" ];
  };

  # Enable cron services
  services.cron = {
    enable = true;
    systemCronJobs = [
      "*/5 * * * *  gsimmer  curl -I -o /dev/null -w \"$(date)|\\%{http_code}\" https://pw.gmem.ca > /home/gsimmer/pw-status"
      "*/5 * * * *  gsimmer  curl -I -o /dev/null -w \"$(date)|\\%{http_code}\" https://hue.gmem.ca > /home/gsimmer/hue-status"
    ];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/NIXOS_SD";
      fsType = "ext4";
    };
  };

  networking.firewall.enable = false;

}
