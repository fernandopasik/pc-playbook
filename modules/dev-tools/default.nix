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
    nodejs
    deno
    go
    ruby
    rustc
    jdk
  ]
}
