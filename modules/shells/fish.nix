{
  pkgs,
  lib,
  ...
}:

{
  hm = {
    home.packages = with pkgs; [ grc ];
    programs = {
      fish = {
        enable = true;

        preferAbbrs = true;
        shellAbbrs =
          let
            inherit (lib)
              getExe
              ;
          in
          with pkgs;
          {
            # nix
            nixPre = "nix store prefetch-file";
            nixUpd = "nix flake update";

            # override default
            trash = getExe pkgs.trashy + " put";
            touch = getExe bonk;
            find = getExe hunt;
            frep = getExe ripgrep-all;

            # cp = "${getExe' fuc "cpz"}";
            # rm = "${getExe' fuc "rmz"}";
            cat = getExe bat;

            # quality of life
            e = "$EDITOR";
            c = "clear";
            x = "exit";

            # useful
            ca = "cava";
            pmx = "pulsemixer";
            blt = getExe bluetui;
            icat = "kitten icat";

            # tops
            btop = "btop";
            ntop = "nvtop -i";

            # clock
            ter =
              getExe tenki
              + "
              --fps 80 \
              --wind disable \
              --timer-color cyan \
              --mode rain
            ";

            # translate
            tr = "trans --brief";
          };

        plugins =
          let
            mk = name: p: {
              inherit name;
              src = p.src;
            };
          in
          (with pkgs.fishPlugins; [
            (mk "colored-man-pages" colored-man-pages)
            (mk "autopair-fish" autopair-fish)
            (mk "fzf-fish" fzf-fish)
            (mk "git-abbr" git-abbr)
            (mk "puffer" puffer)
            (mk "grc" grc)
          ]);

        interactiveShellInit =
          let
            d = "bind -M default";
            v = "bind -M visual";

            col = "set fish_color";
            pag = "set fish_pager_color";

            sel = "${pag}_selected";
            sec = "${pag}_secondary";

            bol = "--bold";
            ita = "--italics";
            bg = "--background";
          in
          # fish
          ''
            fish_vi_key_bindings

            # default
            ${d} d delete-char
            ${d} x cancel

            # visual
            ${v} x down-line

            # colors
            ${col}_cancel       ${bg}=red ${bol} black
            ${col}_comment      gray

            ${pag}_completion   white
            ${sel}_completion   black  ${bol}
            ${sec}_completion   white
            ${pag}_prefix       white
            ${sel}_prefix       black  ${bol}
            ${pag}_description  yellow ${ita}
            ${sel}_description  black
            ${pag}_background   black
            ${sel}_background          ${bg}=green
            ${pag}_progress     black  ${bg}=red
          '';

        shellInitLast =
          # fish
          ''
            set fish_cursor_default      block
            set fish_cursor_insert       line
            set fish_cursor_replace_one  underscore
            set fish_cursor_replace      underscore
            set fish_cursor_visual       block
            set fish_cursor_external     line
          '';
      };
    };
  };
}
