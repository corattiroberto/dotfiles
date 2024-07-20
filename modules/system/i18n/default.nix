{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.modules.i18n;
in {
  options.modules.i18n = {
    enable = lib.mkEnableOption "Enable i18n";

    language = lib.mkOption {
      type = lib.types.str;
      default = "en_US";
      example = "nl_NL";
      description = ''
        Set i18n language
      '';
    };

    encoding = lib.mkOption {
      type = lib.types.str;
      default = "UTF-8";
      example = "UTF-8";
      description = ''
        Set i18n encoding
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    i18n.defaultLocale = "${cfg.language}.${cfg.encoding}";

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "${cfg.language}.${cfg.encoding}";
      LC_IDENTIFICATION = "${cfg.language}.${cfg.encoding}";
      LC_MEASUREMENT = "${cfg.language}.${cfg.encoding}";
      LC_MONETARY = "${cfg.language}.${cfg.encoding}";
      LC_NAME = "${cfg.language}.${cfg.encoding}";
      LC_NUMERIC = "${cfg.language}.${cfg.encoding}";
      LC_PAPER = "${cfg.language}.${cfg.encoding}";
      LC_TELEPHONE = "${cfg.language}.${cfg.encoding}";
      LC_TIME = "${cfg.language}.${cfg.encoding}";
    };
  };
}
