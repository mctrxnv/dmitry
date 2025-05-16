{
  stylix.targets.lightdm.enable = true;

  services = {
    xserver = {
      enable = true;

      displayManager.lightdm = {
        enable = true;
      };
    };
  };
}
