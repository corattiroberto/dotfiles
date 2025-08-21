{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.modules.lazyvim;
in {
  options.modules.lazyvim = {
    enable = lib.mkEnableOption "Enable lazyvim";
    # options
  };

  config = lib.mkIf cfg.enable {

    home.sessionVariables = {
      EDITOR = "nvim";
    };

    programs.neovim = {
      enable = true;
      package = pkgs.neovim-nightly;
      vimAlias = true;
      vimdiffAlias = true;
      withNodeJs = true;
    };
  };
}
