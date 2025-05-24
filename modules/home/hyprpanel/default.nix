{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.modules.hyprpanel;
in {
  options.modules.hyprpanel = {
    enable = lib.mkEnableOption "Enable hyprpanel";
    # options
  };

  config = lib.mkIf cfg.enable {
    # config
  };
}
