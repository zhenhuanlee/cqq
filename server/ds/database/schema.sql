CREATE TABLE words (
  id  SERIAL PRIMARY KEY,
  en  TEXT NOT NULL,
  cn  TEXT DEFAULT '',
  
);
CREATE UNIQUE INDEX enbywords ON words (en);
CREATE INDEX cn ON words (cn);