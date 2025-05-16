{
  outputs = args: import ./build.nix args;

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";

    hardware.url = "github:NixOS/nixos-hardware/master";
    stylix.url = "github:danth/stylix";

    home = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    cursors = {
      url = "github:LilleAila/nix-cursors";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    betterfox = {
      url = "github:HeitorAugustoLN/betterfox-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    base16 = {
      url = "sourcehut:~neverness/design/base16";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    wallpapers = {
      url = "sourcehut:~neverness/design/wallpapers";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    protonfixes = {
      url = "github:Open-Wine-Components/umu-protonfixes";
      flake = false;
    };
    umu-database = {
      url = "https://raw.githubusercontent.com/Open-Wine-Components/umu-database/refs/heads/main/umu-database.csv";
      flake = false;
    };
  };
}
