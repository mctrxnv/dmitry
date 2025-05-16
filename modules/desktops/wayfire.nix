{
  pkgs,
  ...
}:

{
  hm = {
    stylix.targets.wayfire.enable = true;

    wayland.windowManager.wayfire = {
      enable = true;

      plugins = [
        pkgs.wayfirePlugins.wcm
      ];
    };
  };
}
