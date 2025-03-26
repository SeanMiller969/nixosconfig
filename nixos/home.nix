{ config, pkgs, ... }:

{
  home.username = "sean";
  home.homeDirectory = "/home/sean";

  home.stateVersion = "24.11";

  imports = [ ./vscode.nix ];

  home.packages = [
    pkgs.nixd
    pkgs.nil
    pkgs.nixfmt-rfc-style
  ];

  home.file = {

  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
