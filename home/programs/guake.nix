{ pkgs, ... }:

{
  systemd.user.services.guake = {
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
}