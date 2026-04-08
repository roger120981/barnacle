CREATE TABLE `helper_events` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`event_type` text DEFAULT 'helper_command' NOT NULL,
	`thread_id` text,
	`message_count` integer,
	`event_time` text NOT NULL,
	`command` text NOT NULL,
	`invoked_by_id` text,
	`invoked_by_username` text,
	`invoked_by_global_name` text,
	`received_at` text DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) NOT NULL,
	`raw_payload` text NOT NULL
);
--> statement-breakpoint
CREATE INDEX `idx_helper_events_event_time` ON `helper_events` (`event_time`);--> statement-breakpoint
CREATE INDEX `idx_helper_events_command` ON `helper_events` (`command`);--> statement-breakpoint
CREATE INDEX `idx_helper_events_thread_id` ON `helper_events` (`thread_id`);--> statement-breakpoint
CREATE INDEX `idx_helper_events_invoked_by_id` ON `helper_events` (`invoked_by_id`);--> statement-breakpoint
CREATE INDEX `idx_helper_events_event_type` ON `helper_events` (`event_type`);--> statement-breakpoint
CREATE INDEX `idx_helper_events_thread_time` ON `helper_events` (`thread_id`,`event_time`);--> statement-breakpoint
CREATE TABLE `keyValue` (
	`key` text PRIMARY KEY NOT NULL,
	`value` text NOT NULL,
	`createdAt` integer NOT NULL,
	`updatedAt` integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE `tracked_threads` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`thread_id` text NOT NULL,
	`created_at` text NOT NULL,
	`last_checked` text,
	`solved` integer DEFAULT 0 NOT NULL,
	`warning_level` integer DEFAULT 0 NOT NULL,
	`closed` integer DEFAULT 0 NOT NULL,
	`last_message_count` integer,
	`received_at` text DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) NOT NULL,
	`raw_payload` text NOT NULL
);
--> statement-breakpoint
CREATE UNIQUE INDEX `tracked_threads_thread_id_unique` ON `tracked_threads` (`thread_id`);--> statement-breakpoint
CREATE INDEX `idx_tracked_threads_solved` ON `tracked_threads` (`solved`);--> statement-breakpoint
CREATE INDEX `idx_tracked_threads_last_checked` ON `tracked_threads` (`last_checked`);--> statement-breakpoint
CREATE INDEX `idx_tracked_threads_received_at` ON `tracked_threads` (`received_at`);--> statement-breakpoint
CREATE INDEX `idx_tracked_threads_closed` ON `tracked_threads` (`closed`);--> statement-breakpoint
CREATE INDEX `idx_tracked_threads_warning_level` ON `tracked_threads` (`warning_level`);