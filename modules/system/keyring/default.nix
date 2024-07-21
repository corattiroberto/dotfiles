{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.modules.keyring;
in {
  options.modules.keyring = {
    enable = lib.mkEnableOption "Enable keyring";
  };

  config = lib.mkIf cfg.enable {
    services.gnome-keyring.enable = true;
    security.pam.services.greetd.enableGnomeKeyring = true;
  };
}
