{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.modules.mithril-shell;
in {
  options.modules.mithril-shell = {
    enable = lib.mkEnableOption "Enable mithril-shell";
    # options
  };

  config = lib.mkIf cfg.enable {
    services.mithril-shell = {
      enable = true;

      integrations = {
        hyprland.enable = true;
        stylix.enable = true;
      };
    };

    programs.mithril-control-center.enable = true;
  };
}
