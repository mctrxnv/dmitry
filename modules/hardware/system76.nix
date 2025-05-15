{
  hardware.system76.enableAll = true;

  services.system76-scheduler = {
    enable = true;

    settings = {
      cfsProfiles.enable = true;
      processScheduler.pipewireBoost.enable = true;
    };
  };
}
