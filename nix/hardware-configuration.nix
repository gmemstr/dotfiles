{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  services.xserver = {
    libinput = {
      enable = true;
      mouse = { accelProfile = "flat"; };
    };
  };

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/eb8699bd-a9e9-4166-8879-559b244caa20";
      fsType = "ext4";
      options = [ "noatime" "nodiratime" "discard" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/D582-4408";
      fsType = "vfat";
      options = [ "noatime" "nodiratime" "discard" ];
    };

  fileSystems."/mnt/wd" =
    { device = "/dev/disk/by-partlabel/WD";
      fsType = "ext4";
      options = [ "noatime" "nodiratime" "discard" ];
    };

  fileSystems."/mnt/fhg" =
    { device = "/dev/disk/by-label/FHG";
      fsType = "ext4";
      options = [ "noatime" "nodiratime" "discard" ];
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/8a0c74ad-a88f-4ecd-a6ac-d7985355bce6"; }
    ];

  # high-resolution display
  hardware.video.hidpi.enable = lib.mkDefault true;
}
