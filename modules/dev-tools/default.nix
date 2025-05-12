{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # git and github
    git
    git-lfs
    gh
    act

    # Node.js
    nodejs_24
    corepack_24
    nodePackages.npm
    nodePackages.npm-check-updates
    nodePackages.yo
    bun
    deno

    # Python
    python313
    python313Packages.pip
    python313Packages.setuptools
    python313Packages.virtualenv
    pyenv
    pipenv

    # Programming languages
    go
    ruby
    rustc
    jdk

    # Tools
    gcc
    jq
    libffi
    gnumake
    readline
    sqlite
    tk
    yq
  ];

  environment.variables.PKG_CONFIG_PATH = pkgs.lib.makeSearchPath "lib/pkgconfig" [
    pkgs.zlib.dev
    pkgs.openssl.dev
    pkgs.bzip2.dev
    pkgs.libffi.dev
    pkgs.readline.dev
    pkgs.sqlite.dev
  ];

  virtualisation.docker = {
    enable = true;
    rootless.enable = true;
    rootless.setSocketVariable = true;
  };
}
