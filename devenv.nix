{ pkgs, ... }:

{
  # https://devenv.sh/basics/
  env.GREET = "devenv";

  # https://devenv.sh/packages/
  packages = with pkgs; [
    git
    openssl
    hurl
    postgresql
    sqlx-cli
    cargo-watch
    cargo-tarpaulin
    cargo-audit
    cargo-udeps
    bunyan-rs
    pkg-config
    llvmPackages_16.bintools
    clang
  ];

  # https://devenv.sh/scripts/
  scripts.hello.exec = "echo hello from $GREET";
  scripts.init-db.exec = (builtins.readFile ./scripts/init_db.sh);

  enterShell = ''
    export PATH="$HOME/.cargo/bin:$PATH"    
    export PKG_CONFIG_PATH="${pkgs.openssl.dev}/lib/pkgconfig";
  '';

  # https://devenv.sh/languages/
  languages.rust.enable = true;
  languages.rust.version = "latest";

  # https://devenv.sh/pre-commit-hooks/
  # pre-commit.hooks.shellcheck.enable = true;

  # https://devenv.sh/processes/
  # processes.ping.exec = "ping example.com";

  # See full reference at https://devenv.sh/reference/options/
}
