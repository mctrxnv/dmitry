{
  inputs,
  pkgs,
  lib,
  ...
}:

{
  hm = {
    programs.fish.shellAbbrs = {
      wine = "umu-run";
      uwu = "umu-run";
    };
    xdg.configFile."protonfixes" = {
      recursive = true;
      source = inputs.protonfixes;
    };
  };

  environment.systemPackages = with pkgs; [
    (umu-launcher.override {
      extraEnv = {
        SDL_VIDEODRIVER = lib.mkForce "";
        WINEPREFIX = "/home/Games";
        PROTONPATH = toString proton-ge-bin.steamcompattool;
        STORE = toString inputs.umu-database;
      };
    })
  ];
}
