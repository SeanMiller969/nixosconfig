{ config, pkgs, ... }:

{
  home.username = "sean";
  home.homeDirectory = "/home/sean";
  
  home.stateVersion = "24.11";

  home.packages = [
    
  ];

  home.file = {

  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      eamodio.gitlens
      jnoortheen.nix-ide
    ];
  };
}
