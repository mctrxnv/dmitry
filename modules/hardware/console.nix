{
  pkgs,
  ...
}:

let
  font = pkgs.terminus_font;
in

{
  console = {
    enable = true;

    font = font + "/share/consolefonts/ter-v16n.psf.gz";
    packages = [ font ];
    keyMap = "us";
  };
}
