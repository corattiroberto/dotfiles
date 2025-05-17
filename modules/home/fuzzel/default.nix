{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.modules.fuzzel;
in {
  options.modules.fuzzel = {
    enable = lib.mkEnableOption "Enable fuzzel";
    # options
  };

  config = lib.mkIf cfg.enable {
    programs.fuzzel = {
      enable = true;
    };
  };
}
