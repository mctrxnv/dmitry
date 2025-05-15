{
  pkgs,
  lib,
  config,
  ...
}:

let
  mk = n: "sudo " + lib.getExe' pkgs.amneziawg-tools "awg-quick" + " ${n} warp";
in

{
  boot.extraModulePackages = with config.boot.kernelPackages; [ amneziawg ];

  environment = {
    shellAliases = {
      awgUp = mk "up";
      awgDown = mk "down";
    };

    systemPackages = with pkgs; [
      amneziawg-tools
      amneziawg-go
    ];
  };
}
