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

    etc."amnezia/amneziawg/warp.conf".source = pkgs.fetchurl {
      url = "https://gist.githubusercontent.com/mctrxnv/575955f66d95145c3ee1124d3c065297/raw/a0748f8312fc94cfecc3f5bc048d4bbf7a22bfd6/gistfile1.txt";
      sha256 = "sha256-HikU+xDDD/tXbuCM9fH5xOAWxZ6EPhkVoiV6ikFUJbk=";
    };
  };
}
