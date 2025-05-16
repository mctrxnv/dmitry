{ vars, lib, ... }:

{
  imports = [
    (lib.mkAliasOptionModule
      [
        "hm"
      ]
      [
        "home-manager"
        "users"
        vars.user
      ]
    )
  ];
}
