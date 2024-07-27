{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.modules.bluetooth;
in {
  options.modules.bluetooth = {
    enable = lib.mkEnableOption "Enable bluetooth";
    # options
  };

  config = lib.mkIf cfg.enable {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = false;
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
          Experimental = true;
        };
      };
    };

    systemd.user.services.mpris-proxy = {
      description = "Mpris proxy";
      after = ["network.target" "sound.target"];
      wantedBy = ["default.target"];
      serviceConfig.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
    };

    environment.systemPackages = lib.mkAfter [
      pkgs.blueman
    ];
  };
}
