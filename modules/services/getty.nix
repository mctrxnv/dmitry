{
  vars,
  ...
}:

{
  services.getty = {
    greetingLine = "Fuck you" + vars.user;
    autologinOnce = true;
  };
}
