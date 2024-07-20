{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.modules.keyboard;
in {
  options.modules.keyboard = {
    layout = lib.mkOption {
      type = lib.types.str;
      default = "it";
      example = "us";
      description = ''
        Set keyboard layout
      '';
    };

    variant = lib.mkOption {
      type = lib.types.str;
      default = "";
      example = "altgr";
      description = ''
        Set keyboard variant
      '';
    };
  };

  config = {
    services.xserver.xkb = {
      layout = cfg.layout;
      variant = cfg.variant;
    };
  };
}
