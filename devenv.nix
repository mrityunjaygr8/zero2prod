{ pkgs, ... }:

{
  # https://devenv.sh/basics/
  env.GREET = "devenv";

  # https://devenv.sh/packages/
  packages = [ pkgs.git pkgs.openssl pkgs.hurl pkgs.postgresql pkgs.sqlx-cli pkgs.cargo-watch pkgs.cargo-tarpaulin pkgs.cargo-audit pkgs.cargo-udeps pkgs.bunyan-rs];

  # https://devenv.sh/scripts/
  scripts.hello.exec = "echo hello from $GREET";
  scripts.init-db.exec = (builtins.readFile ./scripts/init_db.sh);

  enterShell = ''
    export PATH="$HOME/.cargo/bin:$PATH"    
  '';

  # https://devenv.sh/languages/
  languages.rust.enable = true;

  # https://devenv.sh/pre-commit-hooks/
  # pre-commit.hooks.shellcheck.enable = true;

  # https://devenv.sh/processes/
  # processes.ping.exec = "ping example.com";

  # See full reference at https://devenv.sh/reference/options/
}
