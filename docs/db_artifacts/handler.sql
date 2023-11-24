CREATE TABLE "repositories" (
  "full_name" varchar PRIMARY KEY,
  "issue_url" varchar UNIQUE,
  "commit_url" varchar UNIQUE
);

CREATE TABLE "issues" (
  "url" varchar PRIMARY KEY,
  "number" integer UNIQUE,
  "title" varchar,
  "body" varchar,
  "timeline_url" varchar UNIQUE
);

CREATE TABLE "timelines" (
  "url" varchar PRIMARY KEY,
  "timeline" json
);

CREATE TABLE "commits" (
  "url" varchar PRIMARY KEY,
  "ref" varchar(40),
  "author_login" varchar
);

CREATE TABLE "users" (
  "login" varchar PRIMARY KEY,
  "location" varchar
);

CREATE TABLE "repositories_issues" (
  "repositories_issue_url" varchar,
  "issues_url" varchar,
  PRIMARY KEY ("repositories_issue_url", "issues_url")
);

ALTER TABLE "repositories_issues" ADD FOREIGN KEY ("repositories_issue_url") REFERENCES "repositories" ("issue_url");

ALTER TABLE "repositories_issues" ADD FOREIGN KEY ("issues_url") REFERENCES "issues" ("url");


CREATE TABLE "repositories_commits" (
  "repositories_commit_url" varchar,
  "commits_url" varchar,
  PRIMARY KEY ("repositories_commit_url", "commits_url")
);

ALTER TABLE "repositories_commits" ADD FOREIGN KEY ("repositories_commit_url") REFERENCES "repositories" ("commit_url");

ALTER TABLE "repositories_commits" ADD FOREIGN KEY ("commits_url") REFERENCES "commits" ("url");


ALTER TABLE "timelines" ADD FOREIGN KEY ("url") REFERENCES "issues" ("timeline_url");

ALTER TABLE "commits" ADD FOREIGN KEY ("author_login") REFERENCES "users" ("login");
