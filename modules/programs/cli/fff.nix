{
  pkgs,
  ...
}:

{
  environment = {
    systemPackages = [ pkgs.fff ];

    variables = {
      FFF_HIDDEN = "1";
      FFF_LS_COLORS = "1";
      FFF_COL1 = "1";
      FFF_COL2 = "0";
      FFF_COL3 = "2";
      FFF_COL4 = "6";
      FFF_COL5 = "7";
    };
  };
}
