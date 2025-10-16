{ pkgs, ... }:

{
  imports = [
    ../programs/vscode.nix
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
    ];

    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  programs.home-manager.enable = true;
}
