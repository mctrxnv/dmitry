{
  vars,
  ...
}:

let
  dir = "/etc/nixos";
in

{
  environment = {
    variables.NH_FLAKE = dir;

    shellAliases = {
      rebuild = "nh os switch -H " + vars.machine;
      nixRepl = "nh os repl -H " + vars.machine;
    };
  };

  programs.nh = {
    enable = true;
    clean.enable = true;

    flake = dir;
  };
}
