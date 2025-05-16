{
  pkgs,
  ...
}:

{
  programs = {
    steam = {
      enable = true;

      protontricks.enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true;

      extraCompatPackages = [
        (pkgs.proton-ge-bin.override {
          steamDisplayName = "Proton-GE-unstable";
        })
      ];

      package = pkgs.steam.override {
        extraEnv = {
          MANGOHUD = true;
          OBS_VKCAPTURE = true;
          RADV_TEX_ANISO = 16;
        };

        extraLibraries =
          pkgs: with pkgs; [
            libxkbcommon
            mesa
            wayland
          ];
      };
    };

    gamescope.enable = true;

    gamemode = {
      enable = true;

      settings = {
        general.renice = 10;

        gpu = {
          apply_gpu_optimisations = "accept-responsibility";
          gpu_device = 0;
        };

        custom = {
          start = "${pkgs.libnotify}/bin/notify-send 'GameMode started'";
          end = "${pkgs.libnotify}/bin/notify-send 'GameMode ended'";
        };
      };
    };
  };
}
