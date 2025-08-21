{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.modules.lazyvim;
in {
  options.modules.lazyvim = {
    enable = lib.mkEnableOption "Enable lazyvim";
    # options
  };

  config = lib.mkIf cfg.enable {

    home.sessionVariables = {
      EDITOR = "nvim";
    };

    programs.lazyvim = {
      enable = true;
    };
  };
}
