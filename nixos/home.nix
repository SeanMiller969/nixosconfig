{ config, pkgs, ... }:

{
  home.username = "sean";
  home.homeDirectory = "/home/sean";
  
  home.stateVersion = "24.11";

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

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-marketplace; [
      eamodio.gitlens
      jnoortheen.nix-ide
      # llvm-vs-code-extensions.vscode-clangd
      plorefice.devicetree
      ms-python.python
      ms-python.pylint
      ms-python.debugpy
    ] ++ (with pkgs.vscode-extensions; [
      ms-vscode.cpptools # special case
    ]);

    userSettings = {
      "nix.serverPath" = "nil";
      "nix.serverSettings" = {
        "nil" = {
          "formatting" = {
            "command" = ["nixfmt"];
          };
        };
      };
      "nix.enableLanguageServer" = true;
      "[nix]" = {"editor.formatOnSave" = true;};
    };
  };
}
