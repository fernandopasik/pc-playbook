{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # git and github
    git
    git-lfs
    gh
    act

    # Programming languages
    python3
    python3Packages.pip
    python3Packages.virtualenv
    pyenv
    nodejs_23
    corepack_23
    nodePackages.npm-check-updates
    deno
    go
    ruby
    rustc
    jdk
  ];
}
