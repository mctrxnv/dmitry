{
  vars,
  pkgs,
  lib,
  ...
}:

{
  security.sudo = {
    enable = true;

    wheelNeedsPassword = false;
    execWheelOnly = true;

    extraRules = [
      {
        users = [ vars.user ];
        groups = [ "wheel" ];
        commands = [
          {
            command = lib.getExe pkgs.light;
            options = [ "NOPASSWD" ];
          }
          {
            command = lib.getExe' pkgs.uutils-coreutils-noprefix "tee";
            options = [ "NOPASSWD" ];
          }
        ];
      }
    ];
  };

  security.polkit.enable = true;
}
