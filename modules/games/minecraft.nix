{
  pkgs,
  ...
}:

{
  environment.systemPackages = [
    (pkgs.prismlauncher.override {
      gamemodeSupport = true;
      controllerSupport = true;
      textToSpeechSupport = false;
      jdks = builtins.attrValues {
        inherit (pkgs)
          temurin-jre-bin-23
          temurin-jre-bin # 21
          temurin-jre-bin-17
          temurin-jre-bin-8
          ;
      };
    })
  ];
}
