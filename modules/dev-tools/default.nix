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
    nodePackages.npm
    nodePackages.npm-check-updates
    nodePackages.yo
    bun
    deno

    # Python
    python3
    python3Packages.pip
    python3Packages.setuptools
    python3Packages.virtualenv
    pyenv

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
}
