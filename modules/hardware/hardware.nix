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
  };
}
