{
  pkgs,
  lib,
  ...
}:

{
  environment.systemPackages = with pkgs; [ legendary-gl ];

  hm.xdg.configFile."legendary/config.ini".text = lib.generators.toINI { } {
    "Legendary" = {
      install_dir = "/media/disks/fastBitch/Games";
      locale = "en-US";

      max_memory = 2048;
      max_workers = 8;

      disable_https = false;
      disable_update_check = false;
      disable_update_notice = false;
      disable_auto_aliasing = false;

      log_level = "debug";
    };
  };
}
