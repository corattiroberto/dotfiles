{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.modules.shell;
in {
  options.modules.shell = {
    enable = lib.mkEnableOption "enable shell";
    fish.enable = lib.mkEnableOption "enable fish shell";
  };

  config = lib.mkIf cfg.enable {
    programs.fish = lib.mkIf cfg.fish.enable {
      enable = cfg.fish.enable;

      interactiveShellInit = ''
        set fish_greeting ""
      '';

      shellAliases = {
        "ls" = "eza --icons=always --color=always --group-directories-first --git-ignore";
        "la" = "eza -a --icons=always --color=always --group-directories-first --git-ignore";
        "ll" = "eza -l --git --icons=always --color=always --group-directories-first --git-ignore";
        "lla" = "eza -la --git --icons=always --color=always --group-directories-first --git-ignore";
      };
    };

    users.defaultUserShell =
      if cfg.fish.enable
      then pkgs.fish
      else null;
  };
}
