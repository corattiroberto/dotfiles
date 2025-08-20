{
  inputs,
  user,
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.modules.greetd;
in {
  options.modules.greetd = {
    enable = lib.mkEnableOption "Enable greetd";
  };

  config = lib.mkIf cfg.enable {
    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd Hyprland";
          user = "${user}";
        };
      };
    };
  };
}
