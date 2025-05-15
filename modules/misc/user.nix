{
  vars,
  pkgs,
  ...
}:

let
  passwd = "$6$T.o1DZ9d0Zq.AFDV$.cofYGwgL1NNOqgfuSUO0RToCWrtM.T0Ynxl1dTH4G5CedTAW1bkHwSR18EY8NVtj/1SWQxU0izQ1YQcHvmjq.";
in

{
  time.timeZone = "Asia/Chita";
  services.chrony.enable = true;

  i18n.defaultLocale = "ru_RU.UTF-8";

  programs.fish.enable = true;

  users = {
    defaultUserShell = pkgs.fish;

    users = {
      root = {
        initialHashedPassword = passwd;
      };

      ${vars.user} = {
        isNormalUser = true;
        createHome = true;

        uid = 1000;
        home = "/home/" + vars.user;
        initialHashedPassword = passwd;

        extraGroups = [
          "media"
          "video"
          "audio"

          "wheel"
          "input"
          "networkmanager"

          "transmission"
          "qbittorrent"
          "flood"
        ];
      };
    };
  };

  services.getty.autologinUser = vars.user;
}
