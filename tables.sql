


--
Database: `blog`
--
CREATE DATABASE IF NOT EXISTS `blog` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `blog`;


--
Table structure for table `likes`
--

CREATE TABLE `likes` (
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
insert data for table `likes`
--

INSERT INTO `likes` (`post_id`, `user_id`) VALUES
(3, 5),
(3, 8),
(4, 5);


--
Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `body` varchar(8000) NOT NULL,
  `author_id` int(11) NOT NULL,
  `time_created` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
insert data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `body`, `author_id`, `time_created`, `last_modified`) VALUES
(3, 'engineering updates', 'engineering updates', 5, '2021-05-11 13:25:00', NULL),
(4, 'saying hello', 'hi hello, ....', 8, '2021-05-11 15:00:00', NULL);

-- --------------------------------------------------------

--
Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `occupation` varchar(30) DEFAULT NULL,
  `type` varchar(10) NOT NULL,
  `email` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
insert data for table `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `occupation`, `type`, `email`) VALUES
(5, 'ram', '7684426529', NULL, 'facebook', 'ram.m8@gmail.com'),
(8, 'sham', NULL, 'worker', 'google', 'sham.sham123@gmail.com'),
(9, 'raghav', '8984426529', 'engineer', 'google', 'raghav.g1986@gmail.com');

--
Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`post_id`,`user_id`),
  ADD KEY `like_user` (`user_id`);

--
Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_author` (`author_id`);

--
Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;



--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `like_post` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `like_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `post_author` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

