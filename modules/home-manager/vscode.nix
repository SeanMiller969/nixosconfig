{ nix-vscode-extensions, ... }:
let
  extensions-marketplace = nix-vscode-extensions.vscode-marketplace;
in
{
  programs.vscode = {
    enable = true;
    extensions = with extensions-marketplace; [
      eamodio.gitlens
      jnoortheen.nix-ide
      # llvm-vs-code-extensions.vscode-clangd
      plorefice.devicetree
      ms-python.python
      ms-python.pylint
      ms-python.debugpy
    ];

    userSettings = {
      "nix.serverPath" = "nil";
      "nix.serverSettings" = {
        "nil" = {
          "formatting" = {
            "command" = [ "nixfmt" ];
          };
        };
      };
      "nix.enableLanguageServer" = true;
      "[nix]" = {
        "editor.formatOnSave" = true;
      };
      "nix.hiddenLanguageServerErrors" = [ "textDocument/formatting" ];
    };
  };
}
