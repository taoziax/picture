-- MySQL dump 10.13  Distrib 5.7.41, for linux-glibc2.12 (x86_64)
--
-- Host: localhost    Database: ctms
-- ------------------------------------------------------
-- Server version	5.7.41-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ott_adi`
--

DROP TABLE IF EXISTS `ott_adi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_adi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cspid` varchar(64) DEFAULT NULL,
  `lspid` varchar(64) DEFAULT NULL,
  `correlate_id` varchar(64) DEFAULT NULL,
  `remote_xml_url` varchar(255) DEFAULT NULL,
  `xml_content` text,
  `status` varchar(32) DEFAULT 'wait' COMMENT '状态  wait:等待/doing:执行中/success:成功/fail:失败',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq` (`correlate_id`) USING BTREE,
  KEY `idx` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='C2 ADI';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_category`
--

DROP TABLE IF EXISTS `ott_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_category_video`
--

DROP TABLE IF EXISTS `ott_category_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_category_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1265 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_corner_mark`
--

DROP TABLE IF EXISTS `ott_corner_mark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_corner_mark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `ico` varchar(255) DEFAULT NULL,
  `position` varchar(16) DEFAULT NULL,
  `weight` float(7,3) DEFAULT NULL,
  `set_default` varchar(16) DEFAULT 'inactive',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_corner_mark_video`
--

DROP TABLE IF EXISTS `ott_corner_mark_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_corner_mark_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL,
  `corner_mark_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_cp`
--

DROP TABLE IF EXISTS `ott_cp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_cp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cp_title` varchar(64) NOT NULL,
  `cp_mark` varchar(64) NOT NULL,
  `cp_tag` varchar(64) NOT NULL,
  `cp_config` json DEFAULT NULL,
  `code_mark` varchar(64) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_idx` (`cp_mark`) USING BTREE,
  UNIQUE KEY `code_mark_UNIQUE` (`code_mark`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_cp_c1_task`
--

DROP TABLE IF EXISTS `ott_cp_c1_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_cp_c1_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `task_name` varchar(255) DEFAULT NULL COMMENT '任务名',
  `cp_id` int(11) DEFAULT NULL COMMENT 'cp_id',
  `local_url` text COMMENT '本地包地址',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `access_url` text COMMENT '访问地址',
  `status` varchar(255) DEFAULT NULL COMMENT '任务状态：0待执行 1执行中',
  `error_msg` varchar(255) DEFAULT NULL COMMENT '报错信息',
  `ext` text COMMENT '额外信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `dest_url` varchar(255) DEFAULT NULL COMMENT '目标地址',
  `cdn_url` varchar(255) DEFAULT NULL COMMENT 'cdn内容保存地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='ott_c1_任务信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_cp_category`
--

DROP TABLE IF EXISTS `ott_cp_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_cp_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cp_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `category_name` varchar(255) DEFAULT NULL,
  `cdn_provider` varchar(255) DEFAULT NULL,
  `action` varchar(32) NOT NULL DEFAULT 'add' COMMENT 'add:添加/modify:修改/delete:删除',
  `status` varchar(32) NOT NULL DEFAULT 'wait' COMMENT '状态 wait:等 doing:正在注入 fail:失败 success:成功',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_all` (`cp_id`,`parent_id`,`category_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_cp_category_video`
--

DROP TABLE IF EXISTS `ott_cp_category_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_cp_category_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cp_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `cdn_provider` varchar(255) DEFAULT NULL,
  `action` varchar(32) NOT NULL COMMENT 'add:添加/modify:修改/delete:删除',
  `status` varchar(32) NOT NULL COMMENT '状态 wait:等 doing:正在注入 fail:失败 success:成功',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_all` (`cp_id`,`video_id`,`category_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_cp_cdn_task_log`
--

DROP TABLE IF EXISTS `ott_cp_cdn_task_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_cp_cdn_task_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cp_id` int(11) NOT NULL,
  `task_name` varchar(255) NOT NULL,
  `task_id` int(11) NOT NULL,
  `task_type` varchar(64) NOT NULL,
  `cdn_type` varchar(64) NOT NULL,
  `cdn_action` varchar(64) NOT NULL,
  `cdn_provider` varchar(64) DEFAULT NULL COMMENT 'cdn 提供商',
  `cdn_url` varchar(255) NOT NULL,
  `cdn_xml_content` text,
  `cdn_sync_status` varchar(32) NOT NULL COMMENT '同步状态',
  `cdn_sync_date` datetime DEFAULT NULL,
  `cdn_async_status` varchar(32) DEFAULT NULL,
  `cdn_async_url` varchar(255) DEFAULT NULL,
  `cdn_async_code` varchar(64) DEFAULT NULL COMMENT '异步CODE',
  `cdn_async_other_url` varchar(255) DEFAULT NULL COMMENT '其他CDN回调响应',
  `cdn_async_date` datetime DEFAULT NULL,
  `cdn_async_content` text,
  `cdn_async_origin_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_all` (`cp_id`,`cdn_type`,`cdn_action`,`cdn_sync_status`,`cdn_async_status`,`cdn_sync_date`,`task_type`,`task_id`,`task_name`,`cdn_async_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20841 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_cp_dis_task_log`
--

DROP TABLE IF EXISTS `ott_cp_dis_task_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_cp_dis_task_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cp_id` int(11) NOT NULL,
  `task_name` varchar(225) NOT NULL,
  `task_id` int(11) NOT NULL,
  `task_action` varchar(64) NOT NULL,
  `task_type` varchar(64) NOT NULL,
  `dis_sync_status` varchar(32) DEFAULT NULL,
  `dis_sync_date` datetime DEFAULT NULL,
  `dis_async_status` varchar(32) DEFAULT NULL,
  `dis_async_date` datetime DEFAULT NULL,
  `dis_async_msg` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_all` (`cp_id`,`task_type`,`task_action`,`task_id`,`dis_sync_status`,`dis_async_status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_cp_down_task`
--

DROP TABLE IF EXISTS `ott_cp_down_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_cp_down_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cp_id` int(11) NOT NULL,
  `queue_id` int(11) NOT NULL,
  `video_media_id` int(11) NOT NULL,
  `down_url` varchar(255) NOT NULL,
  `save_full_path` varchar(255) NOT NULL,
  `save_path` varchar(255) NOT NULL,
  `status` varchar(64) NOT NULL DEFAULT 'wait',
  `gid` varchar(64) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `gid_UNIQUE` (`gid`) USING BTREE,
  UNIQUE KEY `down_url_UNIQUE` (`down_url`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_cp_epg_task_log`
--

DROP TABLE IF EXISTS `ott_cp_epg_task_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_cp_epg_task_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cp_id` int(11) NOT NULL,
  `task_name` varchar(225) NOT NULL,
  `task_id` int(11) NOT NULL,
  `task_action` varchar(64) NOT NULL,
  `task_type` varchar(64) NOT NULL,
  `epg_provider` varchar(64) DEFAULT NULL,
  `epg_sync_status` varchar(32) DEFAULT NULL,
  `epg_sync_date` datetime DEFAULT NULL,
  `epg_async_status` varchar(32) DEFAULT NULL,
  `epg_async_date` datetime DEFAULT NULL,
  `epg_async_msg` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_all` (`cp_id`,`task_type`,`task_action`,`task_id`,`epg_sync_status`,`epg_async_status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_cp_examine`
--

DROP TABLE IF EXISTS `ott_cp_examine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_cp_examine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cp_id` int(11) NOT NULL,
  `type` varchar(45) NOT NULL,
  `action` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL DEFAULT 'wait',
  `task_id` int(11) NOT NULL DEFAULT '0',
  `examine_name` varchar(225) NOT NULL,
  `video_id` int(11) NOT NULL,
  `video_episode_id` int(11) NOT NULL,
  `video_media_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_cp_grab_task_log`
--

DROP TABLE IF EXISTS `ott_cp_grab_task_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_cp_grab_task_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cp_id` int(11) NOT NULL,
  `task_id` varchar(255) NOT NULL,
  `task_name` varchar(255) NOT NULL,
  `video_id` int(11) NOT NULL DEFAULT '0',
  `video_episode_id` int(11) NOT NULL DEFAULT '0',
  `video_media_id` int(11) NOT NULL,
  `grab_url` varchar(255) NOT NULL,
  `grab_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_all` (`cp_id`,`task_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_cp_inject_queue`
--

DROP TABLE IF EXISTS `ott_cp_inject_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_cp_inject_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cp_id` int(11) DEFAULT NULL,
  `name` varchar(225) DEFAULT NULL,
  `action` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT 'wait' COMMENT '状态 wait:等待  doing:正在同步 fail:失败 success:成功',
  `feedback_content` longtext,
  `content` longtext,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_cp_manager_user`
--

DROP TABLE IF EXISTS `ott_cp_manager_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_cp_manager_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `cp_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx` (`user_id`,`cp_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_cp_package`
--

DROP TABLE IF EXISTS `ott_cp_package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_cp_package` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cp_id` int(11) NOT NULL,
  `package_name` varchar(255) NOT NULL,
  `type` varchar(32) NOT NULL DEFAULT 'month' COMMENT 'year:包年 month:包月 unit:单点',
  `cdn_provider` varchar(255) DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `price` varchar(32) NOT NULL,
  `action` varchar(32) NOT NULL DEFAULT 'add' COMMENT 'add:添加/modify:修改/delete:删除',
  `status` varchar(32) NOT NULL DEFAULT 'wait' COMMENT '状态 wait:等 doing:正在注入 fail:失败 success:成功',
  `product_id` varchar(64) NOT NULL COMMENT '产品ID',
  `service_id` varchar(64) NOT NULL COMMENT '服务ID',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_all` (`cp_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_cp_package_video`
--

DROP TABLE IF EXISTS `ott_cp_package_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_cp_package_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cp_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `cdn_provider` varchar(255) DEFAULT NULL,
  `action` varchar(32) NOT NULL COMMENT 'add:添加/modify:修改/delete:删除',
  `status` varchar(32) NOT NULL COMMENT '状态 wait:等 doing:正在注入 fail:失败 success:成功',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_all` (`cp_id`,`video_id`,`package_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_cp_queue`
--

DROP TABLE IF EXISTS `ott_cp_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_cp_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cp_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL COMMENT 'video:剧头/episode:节目/media:媒体',
  `action` varchar(32) NOT NULL COMMENT 'add:添加/modify:修改/delete:删除',
  `status` varchar(32) NOT NULL COMMENT '状态 wait:等/doing:进行中',
  `examine_status` varchar(45) NOT NULL DEFAULT 'wait' COMMENT '审核状态状态 wait:等/doing:进行中',
  `queue_name` varchar(255) NOT NULL,
  `video_id` int(11) NOT NULL DEFAULT '0',
  `video_episode_id` int(11) NOT NULL DEFAULT '0',
  `video_media_id` int(11) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_all` (`cp_id`,`type`,`action`,`status`,`video_id`,`video_episode_id`,`video_media_id`,`create_time`,`queue_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=42922 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='中心列队';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_cp_task`
--

DROP TABLE IF EXISTS `ott_cp_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_cp_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cp_id` int(11) NOT NULL,
  `queue_id` int(11) NOT NULL DEFAULT '0',
  `task_name` varchar(255) NOT NULL,
  `type` varchar(32) NOT NULL COMMENT 'video:剧头/episode:节目/media:媒体',
  `cdn_provider` varchar(200) DEFAULT NULL COMMENT 'cdn提供商',
  `epg_provider` varchar(200) DEFAULT NULL,
  `dis_provider` varchar(255) DEFAULT NULL COMMENT '分发状态',
  `action` varchar(32) NOT NULL COMMENT 'add:添加/modify:修改/delete:删除',
  `video_id` int(11) NOT NULL DEFAULT '0',
  `video_episode_id` int(11) NOT NULL DEFAULT '0',
  `video_media_id` int(11) NOT NULL DEFAULT '0',
  `epg_status` varchar(45) NOT NULL COMMENT '状态 wait:等 doing:正在注入 fail:失败 success:成功',
  `cdn_status` varchar(45) NOT NULL COMMENT '状态 wait:等 doing:正在注入 fail:失败 success:成功',
  `dis_status` varchar(255) DEFAULT 'wait' COMMENT '状态 wait:等 doing:正在注入 fail:失败 success:成功',
  `examine_status` varchar(45) NOT NULL DEFAULT 'wait',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_uniq` (`cp_id`,`type`,`video_id`,`video_episode_id`,`video_media_id`) USING BTREE,
  KEY `idx` (`cp_id`,`type`,`action`,`epg_status`,`cdn_status`,`task_name`,`create_time`,`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33997 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_cp_video`
--

DROP TABLE IF EXISTS `ott_cp_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_cp_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL,
  `cp_id` int(11) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_idx` (`cp_id`,`video_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1265 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_cp_video_examine_log`
--

DROP TABLE IF EXISTS `ott_cp_video_examine_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_cp_video_examine_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cp_id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL COMMENT '内容ID',
  `examine_name` varchar(255) NOT NULL,
  `examine_id` int(11) NOT NULL DEFAULT '0',
  `video_id` int(11) NOT NULL DEFAULT '0',
  `video_episode_id` int(11) NOT NULL DEFAULT '0',
  `video_media_id` int(11) NOT NULL,
  `examine_action` varchar(45) NOT NULL,
  `examine_type` varchar(45) NOT NULL COMMENT '审核类型 剧头节目媒体',
  `examine_sync_status` varchar(45) NOT NULL COMMENT '提交审核状态',
  `examine_sync_date` datetime NOT NULL COMMENT '提交审核时间',
  `examine_sync_data` text NOT NULL COMMENT '审核提交数据',
  `examine_async_status` varchar(45) DEFAULT NULL COMMENT '审核回调状态 pass:审核通过,notpass:审核不通过, offline:下线',
  `examine_async_date` datetime DEFAULT NULL,
  `examine_async_data` text COMMENT '异步回调数据',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx` (`examine_name`,`video_id`,`examine_action`,`examine_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_item_picture`
--

DROP TABLE IF EXISTS `ott_item_picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_item_picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL COMMENT '图片类型',
  `seq` int(11) NOT NULL COMMENT '资源id',
  `weight` int(11) DEFAULT '0',
  `item_id` int(11) NOT NULL,
  `item_type` varchar(255) NOT NULL DEFAULT '' COMMENT '资源类型（series,episode）',
  `picture` varchar(500) NOT NULL,
  `status` varchar(255) DEFAULT NULL COMMENT '状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_label`
--

DROP TABLE IF EXISTS `ott_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_label` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `label_type_id` int(11) NOT NULL,
  `total` int(11) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_type_title` (`label_type_id`,`title`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_label_type`
--

DROP TABLE IF EXISTS `ott_label_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_label_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `field` varchar(64) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_field` (`field`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_manager_group`
--

DROP TABLE IF EXISTS `ott_manager_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_manager_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(64) NOT NULL COMMENT '分组名称',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='后台用户分组';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_manager_group_item`
--

DROP TABLE IF EXISTS `ott_manager_group_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_manager_group_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_group_item` (`group_id`,`item_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2292 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='后台分组和栏目绑定';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_manager_item`
--

DROP TABLE IF EXISTS `ott_manager_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_manager_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `item_name` varchar(64) NOT NULL,
  `item_handle` varchar(64) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `weight` int(11) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `item_handle_UNIQUE` (`item_handle`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=390 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='后台栏目权限';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_manager_user`
--

DROP TABLE IF EXISTS `ott_manager_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_manager_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(64) NOT NULL,
  `enable` int(11) NOT NULL COMMENT '是否开启:1开启,0未开启',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username_UNIQUE` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='管理表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_manager_user_group`
--

DROP TABLE IF EXISTS `ott_manager_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_manager_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_user_group` (`user_id`,`group_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='后台用户和分组绑定';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_origin_resource`
--

DROP TABLE IF EXISTS `ott_origin_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_origin_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `duration` int(11) DEFAULT '0',
  `file_size` int(11) DEFAULT NULL,
  `resource_code` varchar(64) DEFAULT NULL,
  `streamtypes` varchar(16) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_r_id` (`resource_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_product_package`
--

DROP TABLE IF EXISTS `ott_product_package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_product_package` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(64) NOT NULL,
  `product_price` decimal(10,2) NOT NULL,
  `product_type` varchar(16) NOT NULL,
  `category_type` int(11) NOT NULL DEFAULT '0' COMMENT '产品分类',
  `validity_day` smallint(6) NOT NULL,
  `enable` varchar(45) NOT NULL COMMENT '''inactive/active''',
  `display` varchar(45) NOT NULL COMMENT '''inactive/active''',
  `thirdparty_sp_code` varchar(64) DEFAULT NULL COMMENT '''第三方SP编码''',
  `thirdparty_product_code` varchar(64) DEFAULT NULL COMMENT '''第三方产品编码''',
  `thirdparty_channel_id` varchar(64) DEFAULT NULL COMMENT '''第三方渠道ID''',
  `thirdparty_service_code` varchar(64) DEFAULT NULL COMMENT '''第三方服务编码''',
  `thirdparty_strategy_id` varchar(64) DEFAULT NULL COMMENT '''第三方策略ID''',
  `auto_renew` varchar(45) DEFAULT 'inactive' COMMENT 'inactive/active强制自动续订',
  `description` varchar(255) DEFAULT NULL COMMENT '产品包描述',
  `weight` smallint(6) DEFAULT '0',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_product_video`
--

DROP TABLE IF EXISTS `ott_product_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_product_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_package_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_product_video_episode`
--

DROP TABLE IF EXISTS `ott_product_video_episode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_product_video_episode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_package_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  `video_episode_id` int(11) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_video`
--

DROP TABLE IF EXISTS `ott_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `sub_title` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL COMMENT '别名',
  `director` varchar(1024) DEFAULT NULL,
  `actor` varchar(1024) DEFAULT NULL,
  `pinyin` varchar(64) DEFAULT NULL,
  `video_type` tinyint(4) DEFAULT '0' COMMENT '影片种类 1:电影 2:电视剧 3:综艺 4:动漫 5:音乐 6:纪实 7:教育 8:体育 9:生活 10:财经 11:微电影 12:品牌 13:新闻 14:广告 15:公开课 16:外语节目 17:青少年 18:博客 19:少儿',
  `genre` varchar(255) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `language` varchar(128) DEFAULT NULL,
  `subtitle_language` varchar(128) DEFAULT '字幕语言',
  `region` varchar(64) DEFAULT NULL,
  `duration` int(11) NOT NULL DEFAULT '0',
  `episode_count` smallint(6) DEFAULT NULL,
  `episode_updated` smallint(6) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `horpic` varchar(255) DEFAULT NULL,
  `poster` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `background` varchar(255) DEFAULT NULL,
  `complete` varchar(16) NOT NULL DEFAULT 'updating' COMMENT 'updating:更新中\\\\nfinished:完结\\\\n',
  `status` varchar(16) NOT NULL DEFAULT 'inactive' COMMENT 'inactive/active',
  `ext` text,
  `resource_code` varchar(64) DEFAULT NULL,
  `third_code` varchar(100) DEFAULT NULL,
  `recycle` varchar(16) DEFAULT 'inactive' COMMENT '是否在回收站   inactive/未删除   active/已经删除',
  `bcharging` varchar(32) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `licensing_start_time` date DEFAULT NULL COMMENT '版权开始时间',
  `licensing_end_time` date DEFAULT NULL COMMENT '版权结束时间',
  `title_pic` varchar(255) DEFAULT '' COMMENT '标题图',
  `view_point` varchar(255) DEFAULT '' COMMENT '一句话看点',
  `release_license_number` varchar(255) DEFAULT NULL COMMENT '公映许可证',
  `priority` int(11) DEFAULT NULL COMMENT '优先级',
  `terminal` varchar(255) DEFAULT NULL COMMENT '授权终端',
  `authorized_operator` varchar(255) DEFAULT NULL COMMENT '授权运营商',
  `score` decimal(2,1) DEFAULT NULL COMMENT '评分',
  `script_writer` varchar(255) DEFAULT NULL COMMENT '编剧',
  `writer` varchar(255) DEFAULT NULL COMMENT '作者',
  `vip_start_time` datetime DEFAULT NULL COMMENT '收费开始时间',
  `vip_end_time` datetime DEFAULT NULL COMMENT '收费结束时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_state` (`status`) USING BTREE,
  KEY `idx_lise` (`title`,`pinyin`) USING BTREE,
  KEY `idx_code` (`resource_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=480 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_video_bind_actor`
--

DROP TABLE IF EXISTS `ott_video_bind_actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_video_bind_actor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL,
  `label_id` int(11) NOT NULL,
  `label_type_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_video` (`video_id`,`label_type_id`) USING BTREE,
  KEY `index_label` (`label_id`) USING BTREE,
  KEY `index_idx` (`video_id`,`label_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12277 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_video_bind_age_group`
--

DROP TABLE IF EXISTS `ott_video_bind_age_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_video_bind_age_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL,
  `label_id` int(11) NOT NULL,
  `label_type_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_video` (`video_id`,`label_type_id`) USING BTREE,
  KEY `index_label` (`label_id`) USING BTREE,
  KEY `index_idx` (`video_id`,`label_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_video_bind_composer`
--

DROP TABLE IF EXISTS `ott_video_bind_composer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_video_bind_composer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL,
  `label_id` int(11) NOT NULL,
  `label_type_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_video` (`video_id`,`label_type_id`) USING BTREE,
  KEY `index_label` (`label_id`) USING BTREE,
  KEY `index_idx` (`video_id`,`label_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_video_bind_director`
--

DROP TABLE IF EXISTS `ott_video_bind_director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_video_bind_director` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL,
  `label_id` int(11) NOT NULL,
  `label_type_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_video` (`video_id`,`label_type_id`) USING BTREE,
  KEY `index_label` (`label_id`) USING BTREE,
  KEY `index_idx` (`video_id`,`label_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19245 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_video_bind_gender`
--

DROP TABLE IF EXISTS `ott_video_bind_gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_video_bind_gender` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL,
  `label_id` int(11) NOT NULL,
  `label_type_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_video` (`video_id`,`label_type_id`) USING BTREE,
  KEY `index_label` (`label_id`) USING BTREE,
  KEY `index_idx` (`video_id`,`label_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_video_bind_genre`
--

DROP TABLE IF EXISTS `ott_video_bind_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_video_bind_genre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL,
  `label_id` int(11) NOT NULL,
  `label_type_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_video` (`video_id`,`label_type_id`) USING BTREE,
  KEY `index_label` (`label_id`) USING BTREE,
  KEY `index_idx` (`video_id`,`label_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=191026 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_video_bind_grade`
--

DROP TABLE IF EXISTS `ott_video_bind_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_video_bind_grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL,
  `label_id` int(11) NOT NULL,
  `label_type_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_video` (`video_id`,`label_type_id`) USING BTREE,
  KEY `index_label` (`label_id`) USING BTREE,
  KEY `index_idx` (`video_id`,`label_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_video_bind_guest`
--

DROP TABLE IF EXISTS `ott_video_bind_guest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_video_bind_guest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL,
  `label_id` int(11) NOT NULL,
  `label_type_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_video` (`video_id`,`label_type_id`) USING BTREE,
  KEY `index_label` (`label_id`) USING BTREE,
  KEY `index_idx` (`video_id`,`label_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_video_bind_host`
--

DROP TABLE IF EXISTS `ott_video_bind_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_video_bind_host` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL,
  `label_id` int(11) NOT NULL,
  `label_type_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_video` (`video_id`,`label_type_id`) USING BTREE,
  KEY `index_label` (`label_id`) USING BTREE,
  KEY `index_idx` (`video_id`,`label_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_video_bind_language`
--

DROP TABLE IF EXISTS `ott_video_bind_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_video_bind_language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL,
  `label_id` int(11) NOT NULL,
  `label_type_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_video` (`video_id`,`label_type_id`) USING BTREE,
  KEY `index_label` (`label_id`) USING BTREE,
  KEY `index_idx` (`video_id`,`label_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=493 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_video_bind_lyricswriter`
--

DROP TABLE IF EXISTS `ott_video_bind_lyricswriter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_video_bind_lyricswriter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL,
  `label_id` int(11) NOT NULL,
  `label_type_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_video` (`video_id`,`label_type_id`) USING BTREE,
  KEY `index_label` (`label_id`) USING BTREE,
  KEY `index_idx` (`video_id`,`label_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_video_bind_region`
--

DROP TABLE IF EXISTS `ott_video_bind_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_video_bind_region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL,
  `label_id` int(11) NOT NULL,
  `label_type_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_video` (`video_id`,`label_type_id`) USING BTREE,
  KEY `index_label` (`label_id`) USING BTREE,
  KEY `index_idx` (`video_id`,`label_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20445 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_video_bind_singer`
--

DROP TABLE IF EXISTS `ott_video_bind_singer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_video_bind_singer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL,
  `label_id` int(11) NOT NULL,
  `label_type_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_video` (`video_id`,`label_type_id`) USING BTREE,
  KEY `index_label` (`label_id`) USING BTREE,
  KEY `index_idx` (`video_id`,`label_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_video_bind_subject`
--

DROP TABLE IF EXISTS `ott_video_bind_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_video_bind_subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL,
  `label_id` int(11) NOT NULL,
  `label_type_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_video` (`video_id`,`label_type_id`) USING BTREE,
  KEY `index_label` (`label_id`) USING BTREE,
  KEY `index_idx` (`video_id`,`label_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_video_bind_textbook_version`
--

DROP TABLE IF EXISTS `ott_video_bind_textbook_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_video_bind_textbook_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL,
  `label_id` int(11) NOT NULL,
  `label_type_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_video` (`video_id`,`label_type_id`) USING BTREE,
  KEY `index_label` (`label_id`) USING BTREE,
  KEY `index_idx` (`video_id`,`label_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_video_bind_week`
--

DROP TABLE IF EXISTS `ott_video_bind_week`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_video_bind_week` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL,
  `label_id` int(11) NOT NULL,
  `label_type_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_video` (`video_id`,`label_type_id`) USING BTREE,
  KEY `index_label` (`label_id`) USING BTREE,
  KEY `index_idx` (`video_id`,`label_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_video_bind_week_day`
--

DROP TABLE IF EXISTS `ott_video_bind_week_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_video_bind_week_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL,
  `label_id` int(11) NOT NULL,
  `label_type_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_video` (`video_id`,`label_type_id`) USING BTREE,
  KEY `index_label` (`label_id`) USING BTREE,
  KEY `index_idx` (`video_id`,`label_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_video_bind_xxx`
--

DROP TABLE IF EXISTS `ott_video_bind_xxx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_video_bind_xxx` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL,
  `label_id` int(11) NOT NULL,
  `label_type_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_video` (`video_id`,`label_type_id`) USING BTREE,
  KEY `index_label` (`label_id`) USING BTREE,
  KEY `index_idx` (`video_id`,`label_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_video_bind_year`
--

DROP TABLE IF EXISTS `ott_video_bind_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_video_bind_year` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL,
  `label_id` int(11) NOT NULL,
  `label_type_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_video` (`video_id`,`label_type_id`) USING BTREE,
  KEY `index_label` (`label_id`) USING BTREE,
  KEY `index_idx` (`video_id`,`label_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=136708 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_video_episode`
--

DROP TABLE IF EXISTS `ott_video_episode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_video_episode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) DEFAULT NULL,
  `seq` smallint(6) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `duration` int(11) DEFAULT '0',
  `horpic` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `status` varchar(16) NOT NULL DEFAULT 'inactive' COMMENT '激活: active/未激活: inactive',
  `resource_code` varchar(64) DEFAULT NULL,
  `recycle` varchar(16) DEFAULT 'inactive' COMMENT '是否在回收站   inactive/未删除   active/已经删除',
  `bcharging` varchar(32) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `season_date` varchar(20) DEFAULT '' COMMENT '综艺节目的期数，可以为空',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `third_code` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx` (`video_id`,`seq`,`status`) USING BTREE,
  KEY `idx_code` (`resource_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17493 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_video_episode_media`
--

DROP TABLE IF EXISTS `ott_video_episode_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_video_episode_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) DEFAULT NULL,
  `video_episode_id` int(11) DEFAULT NULL,
  `seq` smallint(6) DEFAULT NULL,
  `streamtypes` varchar(16) DEFAULT NULL COMMENT 'FD(流畅)，LD(标清)，SD(高清)，HD(超清)，OD(原画)，2K(2K)，4K(4K)',
  `status` varchar(16) NOT NULL DEFAULT 'inactive' COMMENT '激活: active/未激活: inactive',
  `resource_code` varchar(64) NOT NULL DEFAULT '0',
  `recycle` varchar(16) DEFAULT 'inactive' COMMENT '是否在回收站   inactive/未删除   active/已经删除',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `play_url` varchar(255) DEFAULT NULL,
  `cdn_play_url` text,
  `third_code` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_all` (`video_id`,`video_episode_id`,`seq`,`status`) USING BTREE,
  KEY `idx` (`video_episode_id`,`seq`,`status`) USING BTREE,
  KEY `idx_code` (`resource_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18447 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_video_playcount`
--

DROP TABLE IF EXISTS `ott_video_playcount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_video_playcount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL DEFAULT '0',
  `total` int(11) NOT NULL DEFAULT '0',
  `play_dimension` varchar(32) DEFAULT NULL,
  `play_key` varchar(64) NOT NULL,
  `play_val` varchar(64) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `schedule_id` int(11) NOT NULL DEFAULT '0' COMMENT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq` (`video_id`,`schedule_id`,`play_dimension`,`play_key`,`play_val`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ott_video_rating`
--

DROP TABLE IF EXISTS `ott_video_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ott_video_rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL,
  `rating` decimal(10,8) NOT NULL COMMENT '常规方法计算出来的平均值',
  `votes` int(11) NOT NULL COMMENT '投票人数',
  `wrating` decimal(10,8) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq` (`video_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-14 17:40:18
