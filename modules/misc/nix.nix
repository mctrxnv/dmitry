{
  vars,
  inputs,
  pkgs,
  ...
}:

let
  substituters =
    let
      mk = url: "https://" + url;
    in
    [
      (mk "nix-gaming.cachix.org") # NIX GAMING
      (mk "chaotic-nyx.cachix.org") # CHAOTIC
      (mk "helix.cachix.org") # HELIX
      (mk "xache.cachix.org") # MY OWN
      (mk "cache.garnix.io") # AYUGRAM
      (mk "nyx.chaotic.cx") # NYX
      #
      (mk "hyprland.cachix.org") # HYPRLAND
      (mk "cosmic.cachix.org") # COSMIC
      (mk "niri.cachix.org") # NIRI
    ];

  trusted-public-keys = [
    "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4=" # NIX GAMING
    "chaotic-nyx.cachix.org-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8=" # CHAOTIC
    "helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs=" # HELIX
    "xache.cachix.org-1:InoMKnvFvDh+J5gFNHN1mmUONxvYJqFImLJY8/bl9YA=" # MY OWN
    "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g=" # AYUGRAM
    "nyx.chaotic.cx-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8=" # NYX
    #
    "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" # HYPRLAND
    "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" # COSMIC
    "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964=" # NIRI
  ];
in

{
  nix = {
    package = pkgs.nix;

    settings = {
      builders-use-substitutes = true;
      auto-optimise-store = true;
      warn-dirty = false;

      inherit substituters trusted-public-keys;

      trusted-users = [
        vars.user
        "@wheel"
      ];

      experimental-features = [
        "pipe-operators"
        "nix-command"
        "flakes"
      ];
    };
  };

  hm.nix = {
    settings = {
      builders-use-substitutes = true;
      auto-optimise-store = true;
      warn-dirty = false;

      extra-substituters = substituters;
      extra-trusted-public-keys = trusted-public-keys;

      trusted-users = [
        vars.user
        "@wheel"
      ];

      extra-experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  nixpkgs = {
    hostPlatform = vars.platform;

    overlays = [
      (f: p: {
        stable = import inputs.nixpkgs-stable {
          inherit (p)
            system
            config
            ;
        };
      })
    ];

    config = {
      allowUnfree = true;
      allowBroken = true;
    };
  };
}
