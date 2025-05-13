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

  environment.systemPackages = with pkgs; [ git ];

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
        stateVersion = "25.05";
        username = "fernando";

        packages = with pkgs; [ git ];

        file = {
          "repos/.keep".text = "";
          ".zshrc".text = ''
            . ~/repos/dotfiles/utils.sh
          '';
          ".gitconfig.local".text = ''
            [user]
              name = Fernando Pasik
              email = fernando@pasik.com.ar
            [credential "https://github.com"]
              helper =
              helper = !/run/current-system/sw/bin/gh auth git-credential
            [credential "https://gist.github.com"]
              helper =
              helper = !/run/current-system/sw/bin/gh auth git-credential
          '';
        };

        activation.cloneDotfiles = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
          export PATH=${pkgs.git}/bin:$PATH
          DOTFILES_DIR="$HOME/repos/dotfiles"
          if [ ! -d "$DOTFILES_DIR" ]; then
            echo "🧰 Cloning dotfiles into $DOTFILES_DIR"
            git clone https://github.com/fernandopasik/dotfiles.git "$DOTFILES_DIR"
          else
            echo "🧰 Updating dotfiles in $DOTFILES_DIR"
            git -C "$DOTFILES_DIR" pull --rebase
          fi

          ln -sf "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
          ln -sf "$DOTFILES_DIR/.ghconfig.yml" "$HOME/.config/gh/config.yml"
        '';
      };
    };
}
