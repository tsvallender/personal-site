{ pkgs, nixpkgs-ruby, ... }:

{
  # Set environment variables
  env  = {
    APPLICATION_HOST = "localhost:3000";
    DB_HOST = "localhost";
    PSQLPAGER = "pspg";
  };

  # Packages to install
  packages = with pkgs; [
    git
    pspg
    openssl
  ];

  languages.ruby.enable = true;
  languages.ruby.versionFile = ./.ruby-version;

  services.postgres = {
    enable = true;
    listen_addresses = "127.0.0.1";
    initialScript =  ''
      CREATE ROLE summon_player WITH LOGIN PASSWORD 'postgres' SUPERUSER;
    '';
  };

  services.mailhog = {
    enable = true;
  };
}
