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
        ];
      };

  nixpkgs.hostPlatform = vars.platform;
  system.stateVersion = vars.version;
}
