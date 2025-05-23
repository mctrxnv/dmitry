{
  services.auto-cpufreq = {
    enable = true;

    settings = {
      charger = {
        governor = "performance";
        turbo = "auto";
      };

      battery = {
        governor = "powersave";
        turbo = "auto";
        energy_perf_bias = "balance_power";
        platform_profile = "low-power";
        enable_thresholds = true;
      };
    };
  };
}
