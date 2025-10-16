{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    profiles.default.userSettings = {
      "editor.fontSize" = 14;
      "editor.fontFamily" = "Fira Code";
      "editor.fontLigatures" = true;
    };
  };
}