{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.modules.sound;
in {
  options.modules.sound = {
    enable = lib.mkEnableOption "Enable sound";
  };

  config = lib.mkIf cfg.enable {
    sound.enable = true;
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };
}
