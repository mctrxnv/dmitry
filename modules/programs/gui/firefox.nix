{
  vars,
  pkgs,
  ...
}:

{
  environment.systemPackages = [ pkgs.nur.repos.rycee.mozilla-addons-to-nix ];

  hm = {
    stylix.targets.firefox = {
      enable = true;
      colorTheme.enable = true;
      profileNames = [ vars.user ];
    };

    programs.firefox = {
      enable = true;

      profiles.${vars.user} = {
        betterfox = {
          enable = true;
          enableAllSections = true;
        };

        extensions = {
          force = true;

          packages =
            with pkgs.nur.repos.rycee.firefox-addons;
            # https://nur.nix-community.org/repos/rycee
            [
              censor-tracker
              darkreader
              sponsorblock
              stylus
              translate-web-pages
              ublock-origin
            ]
            ++ [
              (buildFirefoxXpiAddon {
                pname = "torrserver-adder";
                version = "2.0.5";
                addonId = "84z74tXJKt8OUrTD@TSA";
                url = "https://addons.mozilla.org/firefox/downloads/file/4264581/torrserver_adder-2.0.5.xpi";
                sha256 = "6783c13fe423c14fbf9dd23ea3232167dc78eeb298594ab802aa9a7b094fb365";
                meta = {
                  mozPermissions = [
                    "http://*/*"
                    "https://*/*"
                    "contextMenus"
                    "downloads"
                    "storage"
                    "tabs"
                    "webRequest"
                    "webRequestBlocking"
                  ];
                };
              })
            ];

          settings = {
            "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}".settings = {
              dbInChromeStorage = true;
            };
          };
        };

        settings = {
          "extensions.autoDisableScopes" = 0;
          "layers.acceleration.force-enabled" = true;
          "gfx.webrender.all" = true;
          "svg.context-properties.content.enabled" = true;
          "ui.key.menuAccessKeyFocuses" = false;
        };
      };

      policies = {
        CaptivePortal = false;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableTelemetry = true;
        DisableFormHistory = true;
        DisplayBookmarksToolbar = false;
        DontCheckDefaultBrowser = true;
        DisableProfileRefresh = true;
        PromptForDownloadLocation = false;
        NetworkPrediction = false;
        showSearchBar = true;
        DisableSetDesktopBackground = true;
        LegacyProfiles = true;
        ManualAppUpdateOnly = true;
        DisableFirefoxScreenshots = true;
        HardwareAcceleration = true;
        PasswordManagerEnabled = true;

        FirefoxHome = {
          Pocket = false;
          Snippets = false;
        };

        SanitizeOnShutdown = {
          Cache = true;
          History = false;
          Cookies = false;
          Downloads = true;
          FormData = true;
          Sessions = true;
          OfflineApps = true;
        };
      };
    };
  };
}
