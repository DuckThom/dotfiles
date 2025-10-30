{ nixpkgs, home-manager, ... }:

let
  system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
in
{
  home = home-manager.lib.homeManagerConfiguration {
    inherit pkgs;

    modules = [
      ../../home/hosts/quackpad.nix
    ];
  };
}
