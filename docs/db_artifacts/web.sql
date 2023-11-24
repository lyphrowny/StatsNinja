CREATE TYPE "billing_plan" AS ENUM (
  'None',
  'Half',
  'Full',
  'Custom'
);

CREATE TABLE "users" (
  "email" varchar PRIMARY KEY,
  "password" varchar,
  "billing" billing_plan,
  "github_account" varchar
);

CREATE TABLE "github_accounts" (
  "login" varchar PRIMARY KEY
);

ALTER TABLE "github_accounts" ADD FOREIGN KEY ("login") REFERENCES "users" ("github_account");
