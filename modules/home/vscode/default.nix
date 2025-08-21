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
  };

  config = lib.mkIf cfg.enable {
    programs.vscode = {
      enable = true;

      profiles.default = {
        userSettings = {
          "window.titleBarStyle" = "custom";

          "workbench.iconTheme" = "material-icon-theme";
          "workbench.startupEditor" = "none";
          "workbench.editor.decorations.colors" = true;
          "workbench.editor.decorations.badges" = true;

          "material-icon-theme.activeIconPack" = "react_redux";
          "files.autoSave" = "afterDelay";
          "files.autoSaveDelay" = 800;

          "editor.formatOnSave" = true;
          "editor.fontLigatures" = true;
          "editor.tabSize" = 2;
          "editor.selectionClipboard" = false;
          "editor.suggestSelection" = "first";
          "editor.linkedEditing" = true;
          "editor.bracketPairColorization.enabled" = true;

          "git.decorations.enabled" = true;

          # cpp
          "C_Cpp.intelliSenseEngine" = "disabled";
          "clangd.path" = "clangd";
          "clangd.arguments" = [
            "--background-index"
            "--clang-tidy"
            "--completion-style=detailed"
            "--header-insertion=iwyu"
          ];

          "cmake.generator" = "Ninja";
          "cmake.buildDirectory" = "\${workspaceFolder}/build";
          "cmake.configureOnOpen" = true;
          "cmake.exportCompileCommandsFile" = true;

          "[cpp]" = { "editor.defaultFormatter" = "xaver.clang-format"; };
          "[c]" = { "editor.defaultFormatter" = "xaver.clang-format"; };
          "clang-format.style" = "LLVM";
        };

        extensions = with pkgs.vscode-extensions; [
          pkief.material-icon-theme
          bbenoist.nix

          # cpp
          llvm-vs-code-extensions.vscode-clangd
          ms-vscode.cpptools
          ms-vscode.cmake-tools
          vadimcn.vscode-lldb
          xaver.clang-format
        ];
      };
    };

    home.packages = with pkgs; [
      clang 
      clang-tools
      cmake
      ninja
      lldb
      gdb
    ];
  };
}
