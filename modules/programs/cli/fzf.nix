{
  hm = {
    stylix.targets.fzf.enable = true;

    programs.fzf = {
      enable = true;

      defaultOptions = [
        "--border=rounded"
        "--info=hidden"
        "--no-mouse"
        "--margin=1,49%,1,1"
        "--padding=0"
      ];
    };
  };
}
