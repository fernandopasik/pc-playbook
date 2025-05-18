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

    # Infrastructure
    dive
    hadolint
    kubectl
    kubernetes-helm
    minikube
    qemu

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

  nixpkgs.config.allowUnfreePredicate =
    pkg: builtins.elem (builtins.parseDrvName pkg.name).name [ "terraform" ];

  environment.variables.PKG_CONFIG_PATH = pkgs.lib.makeSearchPath "lib/pkgconfig" [
    pkgs.zlib.dev
    pkgs.openssl.dev
    pkgs.bzip2.dev
    pkgs.libffi.dev
    pkgs.readline.dev
    pkgs.sqlite.dev
  ];
}
