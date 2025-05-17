{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.modules.icons;
in {
  options.modules.icons = {
    enable = lib.mkEnableOption "Enable icons";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs;
      lib.mkAfter [
        adwaita-icon-theme
        morewaita-icon-theme
      ];

    gtk.iconTheme = lib.mkForce {
      package = pkgs.morewaita-icon-theme;
      name = "MoreWaita";
    };
  };
}
