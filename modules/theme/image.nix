{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:

let
  lutgen = lib.getExe pkgs.lutgen;
  wall = inputs.wallpapers.friezaCast;
in

pkgs.runCommand "output.png" { } ''
  ${lutgen} apply ${wall} -o $out -- ${
    with config.lib.stylix.colors;
    builtins.concatStringsSep " " [
      base00
      base01
      base02
      base03
      base04
      base05
      base06
      base07
      base08
      base09
      base0A
      base0B
      base0C
      base0D
      base0E
      base0F
    ]
  }
''
