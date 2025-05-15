{
  pkgs,
  lib,
  ...
}:

{
  systemd.services = {
    torrserver = {
      enable = false;

      after = [
        "network.target"
        "multi-user.target"
      ];

      wantedBy = [
        "multi-user.target"
      ];

      serviceConfig = {
        Restart = "on-failure";
        Type = "simple";
        TimeoutSec = 30;
        User = "media";
        Group = "media";
        StateDirectory = [ "torrserver" ];
        StateDirectoryMode = lib.mkDefault 775;
        ExecStart = ''
          torrserver \
          -d /var/lib/torrserver \
          -p 8090
        '';
      };
    };
  };
}
