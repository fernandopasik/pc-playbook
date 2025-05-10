{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    zsh
    zplug
    zsh-autosuggestions
    zsh-git-prompt
    zsh-syntax-highlighting
    starship
  ];

  users.defaultUserShell = pkgs.zsh;

  programs.zsh = {
    enable = true;
    enableCompletion = false;

    shellInit = ''
      # Cycle back in the suggestions menu using Shift+Tab
      bindkey '^[[Z' reverse-menu-complete

      bindkey '^B' autosuggest-toggle
      # Make Ctrl+W remove one path segment instead of the whole path
      WORDCHARS=''${WORDCHARS/\/}

      # Highlight the selected suggestion
      zstyle ':completion:*' list-colors ''${(s.:.)LS_COLORS}
      zstyle ':completion:*' menu yes=long select

      bindkey '^[[A' history-substring-search-up
      bindkey '^[[B' history-substring-search-down

      export ZPLUG_HOME=$HOME/.zplug
      source ${pkgs.zplug}/share/zplug/init.zsh

      zplug "zsh-users/zsh-autosuggestions"
      zplug "zsh-users/zsh-syntax-highlighting"
      zplug "zsh-users/zsh-completions"
      zplug "zsh-users/zsh-history-substring-search"

      zplug load

    '';
  };

  programs.starship = {
    enable = true;
    # Configuration written to ~/.config/starship.toml
    settings = {
      add_newline = true;
    };
  };
}
