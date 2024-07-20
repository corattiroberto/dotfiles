{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: let

  cfg = config.modules.ags;

in
{
  imports = [
    inputs.ags.homeManagerModules.default
  ];

  options.modules.ags = {
    enable = lib.mkEnableOption "Enable ags";
  };

  config = lib.mkIf cfg.enable {
    nixpkgs.overlays = lib.mkAfter [
      (final: prev: {
        ags = prev.ags.overrideAttrs (old: {
          buildInputs = old.buildInputs ++ [pkgs.libdbusmenu-gtk3];
        });
      })
    ];

    programs.bun.enable = true;

    home.file = {
      ".dotfiles/modules/home/ags/types" = {
        source = "${pkgs.ags}/share/com.github.Aylur.ags/types";
        recursive = true;
      };

      ".dotfiles/modules/home/ags/palette.css".text = ''
        @define-color base00 #${config.lib.stylix.colors.base00};
        @define-color base01 #${config.lib.stylix.colors.base01};
        @define-color base02 #${config.lib.stylix.colors.base02};
        @define-color base03 #${config.lib.stylix.colors.base03};
        @define-color base04 #${config.lib.stylix.colors.base04};
        @define-color base05 #${config.lib.stylix.colors.base05};
        @define-color base06 #${config.lib.stylix.colors.base06};
        @define-color base07 #${config.lib.stylix.colors.base07};
        @define-color base08 #${config.lib.stylix.colors.base08};
        @define-color base09 #${config.lib.stylix.colors.base09};
        @define-color base0A #${config.lib.stylix.colors.base0A};
        @define-color base0B #${config.lib.stylix.colors.base0B};
        @define-color base0C #${config.lib.stylix.colors.base0C};
        @define-color base0D #${config.lib.stylix.colors.base0D};
        @define-color base0E #${config.lib.stylix.colors.base0E};
        @define-color base0F #${config.lib.stylix.colors.base0F};
      '';
    };

    programs.ags = {
      enable = true;

      configDir = ../ags;

      extraPackages = with pkgs; [
        gtksourceview
        webkitgtk
        accountsservice
      ];
    };

    systemd.user.services.ags = {
      Unit = {
        Description = "ags";
      };
      Install = {
        WantedBy = ["default.target"];
      };
      Service = {
        Type = "simple";
        ExecStart = "${pkgs.ags}/bin/ags";
        Restart = "on-failure";
        RestartSec = 2;
        TimeoutStopSec = 10;
      };
    };
  };
}
