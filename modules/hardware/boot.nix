{
  modulesPath,
  pkgs,
  ...
}:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    kernelParams = [
      "quiet"
      "loglevel=3"
      "nowatchdog"
      "module_blacklist=amdgpu"
    ];

    blacklistedKernelModules = [ "amdgpu" ];

    loader = {
      efi.canTouchEfiVariables = true;
      timeout = 0;

      systemd-boot = {
        enable = true;
        configurationLimit = 3;
      };
    };

    initrd = {
      verbose = false;
      compressor = "zstd";

      compressorArgs = [ "-16" ];

      availableKernelModules = [
        "xhci_pci"
        "ahci"
        "usb_storage"
        "usbhid"
        "sd_mod"
      ];
    };
  };
}
