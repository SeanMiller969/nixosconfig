{ pkgs, ... }:

{

  imports = [ ../modules/home-manager/vscode.nix ];

  home.packages = with pkgs; [
    nixd
    nil
    nixfmt-rfc-style
  ];

  home = {
    username = "sean";
    homeDirectory = "/home/sean";
  };

  home.stateVersion = "24.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
