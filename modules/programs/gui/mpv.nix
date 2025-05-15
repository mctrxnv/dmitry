{
  pkgs,
  lib,
  config,
  ...
}:

{
  hm.programs.mpv = {
    enable = true;

    bindings =
      let
        mk = cmd: desc: ''${cmd}; show-text "${desc}"'';
      in
      {
        WHEEL_UP = "add volume 2";
        WHEEL_DOWN = "add volume -2";
        "Shift+WHEEL_UP" = "add volume 5";
        "Shift+WHEEL_DOWN" = "add volume -5";

        RIGHT = "seek 5";
        l = "seek 5";
        "д" = "seek 5";

        LEFT = "seek -5";
        h = "seek -5";
        "р" = "seek -5";

        UP = "add volume 2";
        k = "add volume 2";
        "л" = "add volume 2";

        DOWN = "add volume -2";
        j = "add volume -2";
        "о" = "add volume -2";

        "Shift+RIGHT" = "seek 10";
        "Shift+LEFT" = "seek -10";

        "Shift+UP" = "add volume 5";
        "Shift+DOWN" = "add volume -5";

        q = "quit";
        "й" = "quit";
        Q = "quit-watch-later";

        SPACE = mk "cycle pause" "Paused";
        p = mk "cycle pause" "Paused";
        "з" = mk "cycle pause" "Paused";

        m = mk "cycle mute" "Muted";
        "ь" = mk "cycle mute" "Muted";

        o = "show-progress";
        "щ" = "show-progress";

        f = "cycle fullscreen";
        "а" = "cycle fullscreen";
        ESC = "set fullscreen no";
      };

    scripts =
      with pkgs.mpvScripts;
      let
        inherit (pkgs) fetchFromGitHub;
      in
      [
        sponsorblock-minimal
        thumbnail
      ]
      ++ [
        (buildLua {
          pname = "navigator";
          version = "unstable";
          src = fetchFromGitHub {
            owner = "jonniek";
            repo = "mpv-filenavigator";
            rev = "51242195da9b3231ab7fde367a63dc58fb6858f3";
            hash = "sha256-JjYDBdoPcNH+SVbOIFICJSM1sH6t6IEA2yHnHMbHpV8=";
          };
        })
      ];

    scriptOpts = {
      sponsorblock-minimal = {
        sponsorblock_minimal-server = "https://sponsor.ajay.app/api/skipSegments";
        sponsorblock_minimal-categories = [
          "sponsor"
          "selfpromo"
        ];
      };

      mpv_thumbnail_script = {
        autogenerate = "yes";
        autogenerate_max_duration = "3600";
        prefer_mpv = "yes";
        mpv_no_sub = "no";
        thumbnail_width = 200;
        thumbnail_height = 200;
        thumbnail_count = 150;
        thumbnail_network = "no";
        background_color = "000000";
      };

      uosc.color =
        with config.lib.stylix.colors;
        lib.concatMapAttrsStringSep "," (name: value: "${name}=${value}") {
          background = base00;
          background_text = base05;
          foreground = base05;
          foreground_text = base00;
          curtain = base0D;
          success = base0A;
          error = base0F;
        };
    };

    config =
      {
        fs = "yes";
        osc = "no";
      }
      // (with config.lib.stylix.colors.withHashtag; {
        osd-font = config.stylix.fonts.sansSerif.name;
        sub-font = config.stylix.fonts.sansSerif.name;
        background-color = "#000000";
        osd-back-color = base01;
        osd-border-color = base01;
        osd-color = base05;
        osd-shadow-color = base00;
      });
  };
}
