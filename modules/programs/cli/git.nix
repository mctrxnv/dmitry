{
  vars,
  pkgs,
  config,
  ...
}:

let
  package = pkgs.gitMinimal;
in

{
  programs.git = {
    enable = true;

    inherit package;
  };

  hm.programs.git =
    let
      cfg = config.programs.git;
    in
    {
      enable = cfg.enable;

      inherit (cfg) package;

      userName = vars.user;
      userEmail = vars.user + "@" + vars.host + ".gay";

      extraConfig = {
        init.defaultBranch = "master";
        safe.directory = "/etc/nixos";

        color = {
          ui = true;
          diff = {
            commit = "yellow";
            frag = "cyan";
            meta = "yellow";
            new = "green";
            old = "red";
            whitespace = "red reverse";
          };
        };
      };

      aliases = {
        lol = "log --graph --decorate --pretty=oneline --abbrev-commit --topo-order";
        root = "rev-parse --show-toplevel";
        st = "status --porcelain --short";
      };
    };
}
