{
  pkgs,
  config,
  ...
}:

{
  hm.xdg.configFile =
    let
      inherit (config.stylix)
        fonts
        ;
      inherit (config.hm.stylix)
        iconTheme
        ;

      ini = pkgs.formats.ini { };

      mk =
        n:
        ini.generate n {
          Appearance = {
            custom_palette = true;
            color_scheme_path =
              with config.lib.stylix.colors;
              let
                ini = pkgs.formats.ini { };
                f = "#ff";
                e = "#8f";

                color = ini.generate "stylix.conf" {
                  ColorScheme = {
                    active_colors = builtins.concatStringsSep ", " [
                      (f + base05)
                      (f + base01)
                      (f + base01)
                      (f + base05)
                      (f + base03)
                      (f + base04)
                      (f + base05)
                      (f + base06)
                      (f + base05)
                      (f + base01)
                      (f + base00)
                      (f + base03)
                      (f + base02)
                      (f + base05)
                      (f + base09)
                      (f + base08)
                      (f + base02)
                      (f + base05)
                      (f + base01)
                      (f + base0E)
                      (e + base0E)
                    ];
                    disabled_colors = builtins.concatStringsSep ", " [
                      (f + base04)
                      (f + base01)
                      (f + base01)
                      (f + base05)
                      (f + base03)
                      (f + base04)
                      (f + base04)
                      (f + base04)
                      (f + base04)
                      (f + base01)
                      (f + base00)
                      (f + base03)
                      (f + base02)
                      (f + base05)
                      (f + base09)
                      (f + base08)
                      (f + base02)
                      (f + base05)
                      (f + base01)
                      (f + base0E)
                      (e + base0E)
                    ];
                    inactive_colors = builtins.concatStringsSep ", " [
                      (f + base04)
                      (f + base01)
                      (f + base01)
                      (f + base05)
                      (f + base03)
                      (f + base04)
                      (f + base04)
                      (f + base04)
                      (f + base04)
                      (f + base01)
                      (f + base00)
                      (f + base03)
                      (f + base02)
                      (f + base05)
                      (f + base09)
                      (f + base08)
                      (f + base02)
                      (f + base05)
                      (f + base01)
                      (f + base0E)
                      (e + base0E)
                    ];
                  };
                };
              in

              color;
            icon_theme = iconTheme.dark;
            standard_dialogs = ''"default"'';
            style = ''"Fusion"'';
          };

          Fonts = {
            fixed = ''"${fonts.sansSerif.name},${toString fonts.sizes.applications},-1,5,50,0,0,0,0,0,Regular"'';
            general = ''"${fonts.sansSerif.name},${toString fonts.sizes.applications},-1,5,50,0,0,0,0,0,Regular"'';
          };

          Interface = {
            activate_item_on_single_click = 1;
            buttonbox_layout = 0;
            cursor_flash_time = 1000;
            dialog_buttons_have_icons = 1;
            double_click_interval = 400;
            keyboard_scheme = 2;
            menus_have_icons = false;
            show_shortcuts_in_context_menus = true;
            toolbutton_style = 4;
            underline_shortcut = 1;
            wheel_scroll_lines = 3;
          };
        };
    in

    {
      "qt5ct/qt5ct.conf".source = mk "qt5ct";
      "qt6ct/qt6ct.conf".source = mk "qt6ct";
    };

  hm.qt = {
    enable = true;

    platformTheme.name = "qtct";
  };
}
