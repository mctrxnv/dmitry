{ vars, lib, ... }:

{
  imports = lib.singleton <| lib.mkAliasOptionModule [ "hm" ] [ "home-manager" "users" vars.user ];
}
