{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.modules.git;
in {
  options.modules.git = {
    enable = lib.mkEnableOption "Enable git";
    # options
  };

  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;
      userName = "Roberto Coratti";
      userEmail = "corattiroberto@gmail.com";
    };
  };
}
