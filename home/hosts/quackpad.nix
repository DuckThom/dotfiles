{ pkgs, ... }:

{
  imports = [
    ../programs/vscode.nix
    ../programs/guake.nix
  ];

  home = {
    stateVersion = "25.05";

    username = "aloy";
    homeDirectory = "/home/aloy";

    packages = with pkgs; [
      vscode 
      direnv 
      btop
      htop
      httpie
      guake
    ];

    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  programs.home-manager.enable = true;
}
