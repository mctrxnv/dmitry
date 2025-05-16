{
  stylix.targets.lightdm.enable = true;

  services = {
    xserver.displayManager.lightdm = {
      enable = true;
    };
  };
}
