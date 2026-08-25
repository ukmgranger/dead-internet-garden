CREATE TABLE IF NOT EXISTS pages (
  slug TEXT PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  kind TEXT NOT NULL DEFAULT 'page',
  visibility TEXT NOT NULL DEFAULT 'public',
  created_at TEXT NOT NULL,
  updated_at TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS revisions (
  id TEXT PRIMARY KEY,
  slug TEXT NOT NULL,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  kind TEXT NOT NULL,
  reason TEXT,
  created_at TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS compost (
  id TEXT PRIMARY KEY,
  note TEXT NOT NULL,
  source TEXT,
  status TEXT NOT NULL DEFAULT 'fresh',
  created_at TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS visits (
  id TEXT PRIMARY KEY,
  route TEXT NOT NULL,
  actor_hash TEXT NOT NULL,
  created_at TEXT NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_revisions_slug ON revisions(slug, created_at);
CREATE INDEX IF NOT EXISTS idx_compost_status ON compost(status, created_at);
CREATE INDEX IF NOT EXISTS idx_visits_route ON visits(route, created_at);
