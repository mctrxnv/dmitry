{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:

let
  inherit (inputs) base16 cursors;
in

{
  stylix = {
    enable = true;
    autoEnable = false;

    image = import ./image.nix {
      inherit
        inputs
        pkgs
        lib
        config
        ;
    };

    base16Scheme = base16.paradise;

    cursor = {
      size = 24;

      name = "GoogleDot-Custom";
      package = cursors.packages.${pkgs.system}.google-cursor.override (
        with config.lib.stylix.colors.withHashtag;
        {
          background_color = base0E;
          outline_color = base00;
          accent_color = base0E;
        }
      );
    };

    fonts = rec {
      emoji = {
        name = "Noto Color Emoji";
        package = pkgs.noto-fonts-color-emoji;
      };

      monospace = {
        name = "CodeNewRoman";
        package = pkgs.nerd-fonts.code-new-roman;
      };

      sansSerif = monospace;

      serif = monospace;
    };

    targets = {
      console.enable = true;
      grub.enable = true;
      fish.enable = true;
      plymouth = {
        enable = true;
        logoAnimated = true;
      };
    };
  };

  hm.stylix = {
    enable = true;
    autoEnable = false;

    iconTheme = {
      enable = true;

      dark = "Papirus-Dark";
      light = "Papirus-Light";

      package = pkgs.papirus-icon-theme.override {
        color = "paleorange";
      };
    };

    targets = {
      # cli
      tmux.enable = true;
      cava = {
        enable = true;
        rainbow.enable = true;
      };
      fish.enable = true;
      nushell.enable = true;
      starship.enable = true;
      # wm
      hyprland = {
        enable = true;
        hyprpaper.enable = true;
      };
      hyprpaper.enable = true;
      sway.enable = true;
      river.enable = true;
      # misc
      foot.enable = true;
      kitty.enable = true;
      mako.enable = false;
      rofi.enable = true;
      bemenu.enable = true;
      # tools
      nixvim.enable = true;
      yazi.enable = true;
      fzf.enable = true;
      bat.enable = true;
      mangohud.enable = true;
      # gui
      spicetify.enable = true;
      nixcord.enable = true;
      zathura.enable = true;
      qutebrowser.enable = true;
      firefox.enable = true;
      floorp.enable = true;
      halloy.enable = true;
      gtk.enable = true;
    };
  };

  environment.systemPackages =
    with pkgs;
    [
      corefonts
      liberation_ttf
      arkpandora_ttf
    ]
    ++ (with nerd-fonts; [ tinos ]);
}
