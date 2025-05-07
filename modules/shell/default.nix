{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    zsh
    zsh-autosuggestions
    zsh-git-prompt
    zsh-syntax-highlighting
  ];

  users.defaultUserShell = pkgs.zsh;

  programs.zsh = {
      enable = true;
      enableCompletion = false;
      zplug = {
        enable = true;
        plugins = [
          { name = "zsh-users/zsh-autosuggestions"; }
          { name = "zsh-users/zsh-syntax-highlighting"; }
          { name = "zsh-users/zsh-completions"; }
          { name = "zsh-users/zsh-history-substring-search"; }
        ];
      };

      shellInit = ''
        # Cycle back in the suggestions menu using Shift+Tab
        bindkey '^[[Z' reverse-menu-complete

        bindkey '^B' autosuggest-toggle
        # Make Ctrl+W remove one path segment instead of the whole path
        WORDCHARS=''${WORDCHARS/\/}

        # Highlight the selected suggestion
        zstyle ':completion:*' list-colors ''${(s.:.)LS_COLORS}
        zstyle ':completion:*' menu yes=long select

        source $ZPLUG_HOME/repos/unixorn/warhol.plugin.zsh/warhol.plugin.zsh
        bindkey '^[[A' history-substring-search-up
        bindkey '^[[B' history-substring-search-down

      '';
    };
}
