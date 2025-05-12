{
  pkgs,
  lib,
  config,
  ...
}:
{
  users.users.fernando = {
    isNormalUser = true;
    home = "/home/fernando";
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "docker"
    ];
  };

  home-manager.users.fernando =
    {
      pkgs,
      lib,
      config,
      ...
    }:
    {
      home = {
        homeDirectory = "/home/fernando";
        stateVersion = "24.11";
        username = "fernando";

        file."repos/.keep".text = "";

        activation.cloneDotfiles = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
          DOTFILES_DIR="$HOME/repos/dotfiles"
          if [ ! -d "$DOTFILES_DIR" ]; then
            echo "🧰 Cloning dotfiles into $DOTFILES_DIR"
            git clone https://github.com/fernandopasik/dotfiles.git "$DOTFILES_DIR"
          else
            echo "🧰 Updating dotfiles in $DOTFILES_DIR"
            git -C "$DOTFILES_DIR" pull --rebase
          fi

          ln -sf "$DOTFILES_DIR/gitconfig" "$HOME/.gitconfig"
        '';
      };
    };
}
