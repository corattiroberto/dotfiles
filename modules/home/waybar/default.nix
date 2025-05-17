{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.modules.waybar;
in {
  options.modules.waybar = {
    enable = lib.mkEnableOption "Enable waybar";
    # options
  };

  config = lib.mkIf cfg.enable {
    programs.waybar = {
      enable = true;
    };
  };
}
