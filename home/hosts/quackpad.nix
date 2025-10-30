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
      guake
    ];

    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  systemd = {
    user.services.guake = {
      Unit = {
        Description = "Guake Terminal";
        PartOf = [ "graphical-session.target" ];
        After = [ "graphical-session.target" ];
      };

      Service = {
        ExecStart = "${pkgs.guake}/bin/guake";
        Restart = "on-failure";
      };

      Install = {
        WantedBy = [ "graphical-session.target" ];
      };
    };
  };

  programs.home-manager.enable = true;
}
