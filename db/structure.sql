-- MySQL dump 10.13  Distrib 5.5.47, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ghada_development
-- ------------------------------------------------------
-- Server version	5.5.47-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `commontator_comments`
--

DROP TABLE IF EXISTS `commontator_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commontator_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creator_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `editor_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `editor_id` int(11) DEFAULT NULL,
  `thread_id` int(11) NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `cached_votes_up` int(11) DEFAULT '0',
  `cached_votes_down` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_commontator_comments_on_c_id_and_c_type_and_t_id` (`creator_id`,`creator_type`,`thread_id`),
  KEY `index_commontator_comments_on_thread_id_and_created_at` (`thread_id`,`created_at`),
  KEY `index_commontator_comments_on_cached_votes_up` (`cached_votes_up`),
  KEY `index_commontator_comments_on_cached_votes_down` (`cached_votes_down`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commontator_subscriptions`
--

DROP TABLE IF EXISTS `commontator_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commontator_subscriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subscriber_id` int(11) NOT NULL,
  `thread_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_commontator_subscriptions_on_s_id_and_s_type_and_t_id` (`subscriber_id`,`subscriber_type`,`thread_id`),
  KEY `index_commontator_subscriptions_on_thread_id` (`thread_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commontator_threads`
--

DROP TABLE IF EXISTS `commontator_threads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commontator_threads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commontable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `commontable_id` int(11) DEFAULT NULL,
  `closed_at` datetime DEFAULT NULL,
  `closer_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `closer_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_commontator_threads_on_c_id_and_c_type` (`commontable_id`,`commontable_type`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lectures`
--

DROP TABLE IF EXISTS `lectures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lectures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `attachment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cooment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `likes` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `lecture_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` enum('male','female') COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `votes`
--

DROP TABLE IF EXISTS `votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `votes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `votable_id` int(11) DEFAULT NULL,
  `votable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `voter_id` int(11) DEFAULT NULL,
  `voter_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vote_flag` tinyint(1) DEFAULT NULL,
  `vote_scope` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vote_weight` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_votes_on_voter_id_and_voter_type_and_vote_scope` (`voter_id`,`voter_type`,`vote_scope`),
  KEY `index_votes_on_votable_id_and_votable_type_and_vote_scope` (`votable_id`,`votable_type`,`vote_scope`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-05 10:16:27
INSERT INTO schema_migrations (version) VALUES ('20160502071151');

INSERT INTO schema_migrations (version) VALUES ('20160502081212');

INSERT INTO schema_migrations (version) VALUES ('20160502081849');

INSERT INTO schema_migrations (version) VALUES ('20160502105611');

INSERT INTO schema_migrations (version) VALUES ('20160502121626');

INSERT INTO schema_migrations (version) VALUES ('20160502131435');

INSERT INTO schema_migrations (version) VALUES ('20160502152537');

INSERT INTO schema_migrations (version) VALUES ('20160502163923');

INSERT INTO schema_migrations (version) VALUES ('20160502164029');

INSERT INTO schema_migrations (version) VALUES ('20160503214211');

INSERT INTO schema_migrations (version) VALUES ('20160503214859');

INSERT INTO schema_migrations (version) VALUES ('20160504091102');

INSERT INTO schema_migrations (version) VALUES ('20160504171305');

INSERT INTO schema_migrations (version) VALUES ('20160504193813');

INSERT INTO schema_migrations (version) VALUES ('20160505041423');

