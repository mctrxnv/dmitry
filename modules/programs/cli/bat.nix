{
  pkgs,
  ...
}:

{
  hm = {
    stylix.targets.bat.enable = true;

    programs.bat = {
      enable = true;

      extraPackages = with pkgs.bat-extras; [
        batwatch
        batgrep
        batdiff
      ];

      config.wrap = "character";
    };
  };
}
