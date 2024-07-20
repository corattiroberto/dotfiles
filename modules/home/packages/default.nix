{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.modules.packages;
in {
  options.modules.packages = {
    enable = lib.mkEnableOption "enable packages";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      eza
      fastfetch
      gnome.nautilus
      brave
      vesktop
      obsidian
      spotify
    ];

    programs = {
      btop.enable = true;
    };
  };
}
