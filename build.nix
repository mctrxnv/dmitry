inputs@{
  self,
  ...
}:

let
  inherit (inputs) nixpkgs;

  nixosModules = with inputs; [
    disko.nixosModules.disko
    home.nixosModules.default
    stylix.nixosModules.stylix
    nur.modules.nixos.default
  ];

  homeModules = with inputs; [
    betterfox.homeManagerModules.betterfox
  ];

  specialArgs = {
    inherit
      inputs
      self
      vars
      ;
  };

  vars = {
    machine = "furryLaptop";
    user = "dmitry";
    host = "parash";
    platform = "x86_64-linux";
    version = "24.11";
  };
in

{
  nixosConfigurations.${vars.machine} = nixpkgs.lib.nixosSystem {
    inherit specialArgs;

    modules =
      [ ./modules ]
      ++ [
        {
          home-manager = {
            backupFileExtension = "back";
            extraSpecialArgs = specialArgs;

            useGlobalPkgs = true;
            useUserPackages = true;

            users.${vars.user} = {
              imports = homeModules;
              home = rec {
                username = vars.user;
                stateVersion = vars.version;
                homeDirectory = "/home/${username}";
              };
            };
          };
        }
      ]
      ++ nixosModules;
  };
}
