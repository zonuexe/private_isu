-- ALTER TABLE したやつ
ALTER TABLE `comments` ADD INDEX `comment_post_id`(`post_id`);
ALTER TABLE `comments` ADD INDEX `comment_created_at`(`created_at`);
ALTER TABLE `users` ADD INDEX `user_del_flg`(`del_flg`);
ALTER TABLE `users` ADD INDEX `user_created_at`(`created_at`);
ALTER TABLE `posts` ADD INDEX `post_user_id`(`user_id`);
ALTER TABLE `posts` ADD INDEX `post_created_at`(`created_at`);
