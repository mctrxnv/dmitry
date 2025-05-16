{
  config,
  ...
}:

{
  hm.programs.tofi = {
    enable = true;

    settings = with config.lib.stylix.colors.withHashtag; {
      history = false;
      hide-cursor = true;
      text-cursor = true;
      font = config.stylix.fonts.monospace.name;
      width = "100%";
      height = "100%";
      border-width = 0;
      outline-width = 0;
      padding-left = "35%";
      padding-top = "20%";
      result-spacing = 25;
      num-results = 9;
      # colors
      background-color = base00;
      text-color = base05;
      prompt-color = base04;
      input-color = base04;
      selection-color = base0E;
      default-result-color = base03;
      selection-background = base01;
      selection-background-padding = 8;
      selection-background-corner-radius = 18;
    };
  };
}
