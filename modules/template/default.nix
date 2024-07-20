{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.modules.template;
in {
  options.modules.template = {
    enable = lib.mkEnableOption "Enable template";
    # options
  };

  config = lib.mkIf cfg.enable {
    # config
  };
}
