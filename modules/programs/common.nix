{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    killall
    nix-init
    nix-tree
    nurl
    wget2
  ];
}
