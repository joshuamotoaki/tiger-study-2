CREATE TABLE `courses` (
	`id` text PRIMARY KEY NOT NULL,
	`code` text NOT NULL,
	`title` text NOT NULL,
	`term` integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE `group_members` (
	`user_id` text NOT NULL,
	`group_id` text NOT NULL,
	PRIMARY KEY(`user_id`, `group_id`),
	FOREIGN KEY (`user_id`) REFERENCES `users`(`netid`) ON UPDATE no action ON DELETE no action,
	FOREIGN KEY (`group_id`) REFERENCES `groups`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE TABLE `groups` (
	`id` text PRIMARY KEY NOT NULL,
	`name` text NOT NULL,
	`course_id` text NOT NULL,
	FOREIGN KEY (`course_id`) REFERENCES `courses`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE TABLE `users` (
	`netid` text PRIMARY KEY NOT NULL,
	`name` text NOT NULL,
	`mail` text NOT NULL,
	`is_admin` integer DEFAULT false NOT NULL
);
--> statement-breakpoint
CREATE UNIQUE INDEX `courses_id_unique` ON `courses` (`id`);--> statement-breakpoint
CREATE UNIQUE INDEX `groups_id_unique` ON `groups` (`id`);--> statement-breakpoint
CREATE UNIQUE INDEX `users_netid_unique` ON `users` (`netid`);