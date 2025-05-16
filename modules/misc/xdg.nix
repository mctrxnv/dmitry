{
  pkgs,
  lib,
  config,
  ...
}:

{
  hm.xdg = {
    mime.enable = true;
    mimeApps =
      {
        enable = true;
      }
      // (
        let
          mk = type: list: (lib.genAttrs list (n: (type + ".desktop")));
        in
        {
          defaultApplications =
            (mk "Helix" [
              "inode/empty"
              "text/plain"
              "text/x-cmake"
              "text/markdown"
              "text/rhtml"
              "text/x-lua"
              "text/x-tex"
              "text/x-java"
              "text/x-ruby"
              "text/x-nix"
              "text/x-python"
              "text/x-readme"
              "text/x-markdown"
              "text/x-devicetree-source"
              "text/octet-stream"
              "application/json"
              "application/x-ruby"
              "application/x-yaml"
              "application/x-shellscript"
              "application/x-docbook+xml"
              "*/javascript"
            ])

            // (mk "swayimg" [
              "image/avif"
              "image/gif"
              "image/heif"
              "image/jpg"
              "image/jpeg"
              "image/jxl"
              "image/png"
              "image/bmp"
              "image/x-eps"
              "image/x-icns"
              "image/x-ico"
              "image/x-portable-bitmap"
              "image/x-portable-graymap"
              "image/x-portable-swayimgmap"
              "image/x-xbitmap"
              "image/x-xswayimgmap"
              "image/tiff"
              "image/x-psd"
              "image/x-webp"
              "image/webp"
              "image/x-tga"
              "image/svg+xml"
            ])

            // (mk "mpv" [
              "video/3gp"
              "video/3gpp"
              "video/3gpp2"
              "video/avi"
              "video/divx"
              "video/dv"
              "video/fli"
              "video/flv"
              "video/mp2t"
              "video/mp4"
              "video/mp4v-es"
              "video/mpeg"
              "video/msvideo"
              "video/ogg"
              "video/quicktime"
              "video/vnd.divx"
              "video/vnd.mpegurl"
              "video/vnd.rn-realvideo"
              "video/webm"
              "video/x-avi"
              "video/x-flv"
              "video/x-m4v"
              "video/x-matroska"
              "video/x-mpeg2"
              "video/x-ms-asf"
              "video/x-msvideo"
              "video/x-ms-wmv"
              "video/x-ms-wmx"
              "video/x-ogm"
              "video/x-ogm+ogg"
              "video/x-theora"
              "video/x-theora+ogg"
              "application/x-matroska"
            ])

            // (mk "mpv" [
              "audio/aac"
              "audio/mp4"
              "audio/mpeg"
              "audio/mpegurl"
              "audio/ogg"
              "audio/vnd.rn-realaudio"
              "audio/vorbis"
              "audio/x-flac"
              "audio/x-mp3"
              "audio/x-mpegurl"
              "audio/x-ms-wma"
              "audio/x-musepack"
              "audio/x-oggflac"
              "audio/x-pn-realaudio"
              "audio/x-scpls"
              "audio/x-speex"
              "audio/x-vorbis"
              "audio/x-vorbis+ogg"
              "audio/x-wav"
            ])

            // (mk "org.qutebrowser.qutebrowser" [
              "text/html"
              "application/xhtml+xml"
              "x-scheme-handler/ftp"
              "x-scheme-handler/http"
              "x-scheme-handler/https"
              "x-scheme-handler/chrome"
              "x-scheme-handler/about"
              "x-scheme-handler/unknown"
              "application/x-extension-htm"
              "application/x-extension-xht"
              "application/x-extension-html"
              "application/x-extension-shtml"
              "application/x-extension-xhtml"
            ])

            // (mk "libreoffice-writer" [
              "application/msword"
              "application/vnd.oasis.opendocument.text"
              "application/vnd.oasis.opendocument.text-template"
              "application/vnd.oasis.opendocument.text-web"
              "application/vnd.oasis.opendocument.text-master"
            ])

            // (mk "libreoffice-calc" [
              "application/vnd.ms-excel"
              "application/vnd.oasis.opendocument.spreadsheet"
              "application/vnd.oasis.opendocument.spreadsheet-template"
              "application/vnd.oasis.opendocument.chart"
              "text/csv"
            ])

            // (mk "libreoffice-impress" [
              "application/vnd.ms-powerpoint"
              "application/vnd.oasis.opendocument.presentation"
              "application/vnd.oasis.opendocument.presentation-template"
            ])

            // (mk "libreoffice-draw" [
              "application/vnd.oasis.opendocument.graphics"
              "application/vnd.oasis.opendocument.graphics-template"
              "application/vnd.oasis.opendocument.image"
            ])

            // {
              # office
              "application/pdf" = "org.pwmt.zathura.desktop";
              "application/vnd.oasis.opendocument.formula" = "libreoffice-math.desktop";
              "application/vnd.oasis.opendocument.database" = "libreoffice-base.desktop";
            };
        }
      );
    portal =
      {
        enable = true;
      }
      // {
        config.common.default = [ "gtk" ];
        extraPortals = with pkgs; [
          xdg-desktop-portal-gtk
          xdg-desktop-portal-hyprland
        ];
      };
    userDirs =
      let
        mk = config.hm.home.homeDirectory;
      in
      {
        enable = true;
      }
      // rec {
        createDirectories = true;

        # xdg default
        desktop = mk + "/Desktop";
        documents = mk + "/Documents";
        download = mk + "/Downloads";
        music = mk + "/Music";
        pictures = mk + "/Pictures";
        publicShare = mk + "/";
        templates = mk + "/";
        videos = mk + "/Videos";

        extraConfig = {
          XDG_STUDY_DIR = mk + "/Study";
          XDG_SCREENSHOTS_DIR = pictures + "/Screenshots";
        };
      };
    desktopEntries =
      let
        mk = name: {
          inherit name;
          noDisplay = true;
        };
      in
      {
        # qt
        qt5ct = mk "qt5ct";
        qt6ct = mk "qt6ct";

        # cli
        nvtop = mk "nvtop";
        btop = mk "btop";
        fish = mk "fish";

        # shit
        rofi = mk "rofi";
        rofi-theme-selector = mk "rofi-theme-selector";

        # office
        base = mk "base";
        calc = mk "calc";
        draw = mk "draw";
        impress = mk "impress";
        math = mk "math";
        writer = mk "writer";
      };
  };
}
