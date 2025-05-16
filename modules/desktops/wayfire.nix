{
  pkgs,
  ...
}:

{
  hm = {
    stylix.targets.wayfire = true;

    wayland.windowManager.wayfire = {
      enable = true;

      plugins = [
        pkgs.wayfirePlugins.wcm
      ];
    };
  };
}
