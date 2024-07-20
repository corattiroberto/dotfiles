{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.modules.themes;
in {
  options.modules.themes = {
    enable = lib.mkEnableOption "enable themes";
  };

  config = lib.mkIf cfg.enable {
    #  gtk = {
    #    enable = true;
    #    theme = lib.mkForce {
    #      package = pkgs.solarc-gtk-theme;
    #      name = "SolArc-Dark";
    #    };

    #    iconTheme = {
    #      package = pkgs.adwaita-icon-theme;
    #      name = "Adwaita";
    #    };
    #  };
  };
}
