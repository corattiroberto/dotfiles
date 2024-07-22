{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.modules.notifications;
in {
  options.modules.notifications = {
    enable = lib.mkEnableOption "Enable notifications";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      libnotify
    ];
  };
}
