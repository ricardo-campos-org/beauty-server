-- Tables

CREATE TABLE IF NOT EXISTS clinica (
  id                     SERIAL,
  name                   VARCHAR(30) NOT NULL,
  email                  VARCHAR(100) NOT NULL,
  password               VARCHAR(300) NOT NULL,
  passsword_recover_hash VARCHAR(300) NULL DEFAULT NULL,
  disabled_at            TIMESTAMP NULL,
  created_at             TIMESTAMP NOT NULL,
  updated_at             TIMESTAMP NULL DEFAULT NULL,
  CONSTRAINT clinica_pk PRIMARY KEY id,
  CONSTRAINT clinica_email_unique UNIQUE email
);

CREATE TABLE IF NOT EXISTS customers (
  id               SERIAL,
  name             VARCHAR(50)
  birthdate        DATE NULL,
  fone_number      VARCHAR(11) NULL,
  email            VARCHAR(100) NOT NULL,
  indication_id    INTEGER NULL DEFAULT NULL,
  indication_count INTEGER NULL DEFAULT NULL,
  disabled_at      TIMESTAMP NULL,
  created_at       TIMESTAMP NOT NULL,
  updated_at       TIMESTAMP NULL DEFAULT NULL,
);
CREATE TABLE IF NOT EXISTS agenda ();
CREATE TABLE IF NOT EXISTS services ();

-- Indexes

-- Trigger
