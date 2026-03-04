import { Database } from "bun:sqlite"
import { existsSync, mkdirSync } from "node:fs"
import { dirname, resolve } from "node:path"
import { drizzle } from "drizzle-orm/bun-sqlite"
import { migrate } from "drizzle-orm/bun-sqlite/migrator"

import * as schema from "./db/schema.js"

const DB_PATH = Bun.env.DB_PATH ?? "data/hermit.sqlite"
const MIGRATIONS_FOLDER = Bun.env.DRIZZLE_MIGRATIONS ?? "drizzle"

mkdirSync(dirname(DB_PATH), { recursive: true })

const sqlite = new Database(DB_PATH)
sqlite.exec("PRAGMA journal_mode = WAL;")
sqlite.exec("PRAGMA synchronous = NORMAL;")

export const db = drizzle(sqlite, { schema })

const migrationsPath = resolve(MIGRATIONS_FOLDER)
if (existsSync(migrationsPath) && Bun.env.SKIP_DB_MIGRATIONS !== "1") {
	migrate(db, { migrationsFolder: migrationsPath })
}

export { DB_PATH, sqlite }
