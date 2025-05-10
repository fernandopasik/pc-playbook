{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # git and github
    git
    git-lfs
    gh
    act

    # Node.js
    nodejs_23
    corepack_23
    nodePackages.npm-check-updates
    nodePackages.yo
    bun
    deno

    # Python
    python3
    python3Packages.pip
    python3Packages.virtualenv
    pyenv

    # Programming languages
    go
    ruby
    rustc
    jdk

    # Tools
    gcc
    libffi
    gnumake
    readline
    sqlite
  ];
}
