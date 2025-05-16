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
          ./programs/gui/kitty
        ];

        include = [
          ./desktops/sway/sway.nix
          ./programs/gui/kitty/default.nix
        ];
      };

  nixpkgs.hostPlatform = vars.platform;

  system.stateVersion = vars.version;
}
