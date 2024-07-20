{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.modules.vscode;
in {
  options.modules.vscode = {
    enable = lib.mkEnableOption "Enable vscode";
    # options
  };

  config = lib.mkIf cfg.enable {
    programs.vscode = {
      enable = true;

      userSettings = {
        "window.titleBarStyle" = "custom";

        "workbench.iconTheme" = "material-icon-theme";
        "workbench.startupEditor" = "none";
        "workbench.editor.decorations.colors" = true;
        "workbench.editor.decorations.badges" = true;

        "material-icon-theme.activeIconPack" = "react_redux";
        "files.autoSaveDelay" = 800;

        "editor.formatOnSave" = true;
        "editor.fontLigatures" = true;
        "editor.tabSize" = 2;
        "editor.selectionClipboard" = false;
        "editor.suggestSelection" = "first";
        "editor.linkedEditing" = true;
        "editor.bracketPairColorization.enabled" = true;

        "git.decorations.enabled" = true;
      };
    };
  };
}
