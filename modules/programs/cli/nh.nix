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
      rebuild = "nh os switch -H " + vars.host;
      nixRepl = "nh os repl -H " + vars.host;
    };
  };

  programs.nh = {
    enable = true;
    clean.enable = true;

    flake = dir;
  };
}
