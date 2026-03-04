import { integer, sqliteTable, text } from "drizzle-orm/sqlite-core"

export const keyValue = sqliteTable("keyValue", {
	key: text().primaryKey(),
	value: text().notNull(),
	createdAt: integer({ mode: "timestamp_ms" })
		.notNull()
		.$defaultFn(() => new Date()),
	updatedAt: integer({ mode: "timestamp_ms" })
		.notNull()
		.$defaultFn(() => new Date())
		.$onUpdateFn(() => new Date())
})

export type KeyValue = typeof keyValue.$inferSelect
export type NewKeyValue = typeof keyValue.$inferInsert
