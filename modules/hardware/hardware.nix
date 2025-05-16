{
  hardware = {
    bluetooth = {
      enable = true;

      powerOnBoot = false;

      settings.General = {
        Experimental = true;
        Enable = "Source,Sink,Media,Socket";
      };
    };

    graphics = {
      enable = true;
      enable32Bit = true;
    };

    amdgpu = {
      initrd.enable = true;
      amdvlk = {
        enable = true;
        support32Bit.enable = true;
        supportExperimental.enable = true;
      };
    };
  };
}
