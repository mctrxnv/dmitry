{
  vars,
  lib,
  ...
}:

{
  imports =
    (import ./umport.nix {
      inherit
        lib
        ;
    })
      {
        path = ./.;

        exclude = [
          ./default.nix
          ./umport.nix
          ./theme/image.nix
          ./desktops/sway
          ./desktops/waybar
        ];

        include = [
          ./desktops/sway/default.nix
          ./desktops/waybar/default.nix
        ];
      };

  nixpkgs.hostPlatform = vars.platform;

  system.stateVersion = vars.version;
}
