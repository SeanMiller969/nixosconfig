{ ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    history.size = 10000;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
      ];
      theme = "eastwood";
    };

    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/nixosconfig#sean";
    };
  };
}
