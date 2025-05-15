{
  programs = {
    nano.enable = false;
    command-not-found.enable = false;
  };

  documentation = {
    enable = false;

    dev.enable = false;
    doc.enable = false;
    info.enable = false;
    man.enable = false;
    nixos.enable = false;
  };

  hm = {
    programs.man.enable = false;

    news.display = "silent";

    manual = {
      html.enable = false;
      json.enable = false;
      manpages.enable = false;
    };
  };
}
