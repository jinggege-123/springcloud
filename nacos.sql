/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50730
 Source Host           : localhost:3306
 Source Schema         : nacos

 Target Server Type    : MySQL
 Target Server Version : 50730
 File Encoding         : 65001

 Date: 21/06/2022 17:22:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `c_use` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `effect` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `c_schema` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `encrypted_data_key` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '秘钥',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfo_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info
-- ----------------------------
INSERT INTO `config_info` VALUES (5, 'nacos-01.yaml', 'DEFAULT_GROUP', 'order:\n    title: wqerqwer', 'd88fa7674247ac6b4651cb2705e80e69', '2022-06-17 03:36:14', '2022-06-17 03:38:43', 'nacos', '0:0:0:0:0:0:0:1', '', '', '', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (18, 'nacos-02-dev.yaml', 'DEFAULT_GROUP', 'order:\r\n    number: dev', '5c645335709c5973b2767b07bccb0022', '2022-06-17 05:45:07', '2022-06-17 05:45:07', NULL, '0:0:0:0:0:0:0:1', '', '7d96b232-3a85-4bd5-bb57-fa630a50a05b', NULL, NULL, NULL, 'yaml', NULL, '');
INSERT INTO `config_info` VALUES (19, 'nacos-02-dev.yaml', 'DEFAULT_GROUP', 'order:\n    number: prod', 'b19a25429b41123b1dca54e68324ca4d', '2022-06-17 05:46:29', '2022-06-17 05:46:51', 'nacos', '0:0:0:0:0:0:0:1', '', '0d8c0105-8d08-4846-9426-ab1898c77bc1', '', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (20, 'nacos-02-dev.yaml', 'DEFAULT_GROUP', 'order:\n    number: test', 'e590f7b6613c1400c1805eb13cfad717', '2022-06-17 05:46:38', '2022-06-17 05:47:03', 'nacos', '0:0:0:0:0:0:0:1', '', 'be4eb556-c7e9-4c1b-8ad1-0a69d27bf988', '', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (23, 'nacos-02-dev.yaml', 'consumer-server', 'order:\n    number: prod-consumer-server', '6de0b988d29227fd19f54de570d18a12', '2022-06-17 05:50:50', '2022-06-17 05:51:07', 'nacos', '0:0:0:0:0:0:0:1', '', '0d8c0105-8d08-4846-9426-ab1898c77bc1', '', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (25, 'db.yaml', 'DEFAULT_GROUP', 'data:\n    url: http://127.0.0.1\n    username: admin \n    password: 123456\n', 'd3d28e09d72cc57f88b968bab11fea7e', '2022-06-17 06:06:41', '2022-06-17 06:23:08', 'nacos', '0:0:0:0:0:0:0:1', '', '', '', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (27, 'nacos-02.yaml', 'consumer-server', 'order:\n    number: prod-consumer-server', '6de0b988d29227fd19f54de570d18a12', '2022-06-21 01:58:48', '2022-06-21 01:58:48', NULL, '0:0:0:0:0:0:0:1', '', '', '', NULL, NULL, 'yaml', NULL, '');
INSERT INTO `config_info` VALUES (28, 'my-sentinel-flow-rule', 'DEFAULT_GROUP', '[\r\n  {\r\n    \"clusterMode\": false,\r\n    \"controlBehavior\": 0,\r\n    \"count\": 1.0,\r\n    \"grade\": 1,\r\n    \"limitApp\": \"default\",\r\n    \"maxQueueingTimeMs\": 500,\r\n    \"resource\": \"sayHello\",\r\n    \"strategy\": 0,\r\n    \"warmUpPeriodSec\": 10\r\n  }\r\n]', 'c3d29f5436e88ec57b9a19f195b3e983', '2022-06-21 07:54:16', '2022-06-21 07:54:16', NULL, '0:0:0:0:0:0:0:1', '', '', 'my-sentinel-flow-rule', NULL, NULL, 'json', NULL, '');

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime(0) NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfoaggr_datagrouptenantdatum`(`data_id`, `group_id`, `tenant_id`, `datum_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '增加租户字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '秘钥',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfobeta_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_beta' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfotag_datagrouptenanttag`(`data_id`, `group_id`, `tenant_id`, `tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_tag' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tag_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE INDEX `uk_configtagrelation_configidtag`(`id`, `tag_name`, `tag_type`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_tag_relation' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '集群、各Group容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info`  (
  `id` bigint(64) UNSIGNED NOT NULL,
  `nid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `op_type` char(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '秘钥',
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `idx_gmt_create`(`gmt_create`) USING BTREE,
  INDEX `idx_gmt_modified`(`gmt_modified`) USING BTREE,
  INDEX `idx_did`(`data_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '多租户改造' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
INSERT INTO `his_config_info` VALUES (0, 1, 'order-config.ymal', 'DEFAULT_GROUP', '', 'order\r\n    title: qwer', '1220d6c5293d43acbe82900a11020040', '2022-06-17 11:08:14', '2022-06-17 03:08:15', NULL, '0:0:0:0:0:0:0:1', 'I', '', '');
INSERT INTO `his_config_info` VALUES (1, 2, 'order-config.ymal', 'DEFAULT_GROUP', '', 'order\r\n    title: qwer', '1220d6c5293d43acbe82900a11020040', '2022-06-17 11:10:13', '2022-06-17 03:10:13', NULL, '0:0:0:0:0:0:0:1', 'D', '', '');
INSERT INTO `his_config_info` VALUES (0, 3, 'order-config', 'DEFAULT_GROUP', '', 'order.config:qwer', '8db8c4d2d660c93cbad033959cbe2919', '2022-06-17 11:10:44', '2022-06-17 03:10:45', NULL, '0:0:0:0:0:0:0:1', 'I', '', '');
INSERT INTO `his_config_info` VALUES (2, 4, 'order-config', 'DEFAULT_GROUP', '', 'order.config:qwer', '8db8c4d2d660c93cbad033959cbe2919', '2022-06-17 11:16:16', '2022-06-17 03:16:16', NULL, '0:0:0:0:0:0:0:1', 'D', '', '');
INSERT INTO `his_config_info` VALUES (0, 5, 'nacos-config.ymal', 'DEFAULT_GROUP', '', 'order:\r\n    title: qwer', '488696a189d0f38fc77d41d76c7dd6a9', '2022-06-17 11:16:44', '2022-06-17 03:16:44', NULL, '0:0:0:0:0:0:0:1', 'I', '', '');
INSERT INTO `his_config_info` VALUES (3, 6, 'nacos-config.ymal', 'DEFAULT_GROUP', '', 'order:\r\n    title: qwer', '488696a189d0f38fc77d41d76c7dd6a9', '2022-06-17 11:32:53', '2022-06-17 03:32:53', NULL, '0:0:0:0:0:0:0:1', 'D', '', '');
INSERT INTO `his_config_info` VALUES (0, 7, 'naocs-01.yaml', 'DEFAULT_GROUP', '', 'order:\r\n    title: qerw', '1a469748a57b247232c2d962139ef04e', '2022-06-17 11:33:22', '2022-06-17 03:33:22', NULL, '0:0:0:0:0:0:0:1', 'I', '', '');
INSERT INTO `his_config_info` VALUES (4, 8, 'naocs-01.yaml', 'DEFAULT_GROUP', '', 'order:\r\n    title: qerw', '1a469748a57b247232c2d962139ef04e', '2022-06-17 11:35:45', '2022-06-17 03:35:46', NULL, '0:0:0:0:0:0:0:1', 'D', '', '');
INSERT INTO `his_config_info` VALUES (0, 9, 'nacos-01.yaml', 'DEFAULT_GROUP', '', 'order:\r\n    title: wqer', '7cd66723ddc12479195db70082e1582b', '2022-06-17 11:36:14', '2022-06-17 03:36:14', NULL, '0:0:0:0:0:0:0:1', 'I', '', '');
INSERT INTO `his_config_info` VALUES (5, 10, 'nacos-01.yaml', 'DEFAULT_GROUP', '', 'order:\r\n    title: wqer', '7cd66723ddc12479195db70082e1582b', '2022-06-17 11:38:43', '2022-06-17 03:38:43', 'nacos', '0:0:0:0:0:0:0:1', 'U', '', '');
INSERT INTO `his_config_info` VALUES (0, 11, 'nacos-02', 'DEFAULT_GROUP', '', 'order:\r\n    number: 1234', 'b03547b92633bac80835e1bdfc6bdd87', '2022-06-17 13:18:14', '2022-06-17 05:18:14', NULL, '0:0:0:0:0:0:0:1', 'I', '', '');
INSERT INTO `his_config_info` VALUES (7, 12, 'nacos-02', 'DEFAULT_GROUP', '', 'order:\r\n    number: 1234', 'b03547b92633bac80835e1bdfc6bdd87', '2022-06-17 13:19:00', '2022-06-17 05:19:00', NULL, '0:0:0:0:0:0:0:1', 'D', '', '');
INSERT INTO `his_config_info` VALUES (0, 13, 'nacos-02-dev.yaml', 'DEFAULT_GROUP', '', 'order:\r\n    number: 1324', '1096fe53e91d2b5b27603069f13f3cf4', '2022-06-17 13:19:48', '2022-06-17 05:19:49', NULL, '0:0:0:0:0:0:0:1', 'I', '', '');
INSERT INTO `his_config_info` VALUES (0, 14, 'nacos-02-dev.yaml', 'DEFAULT_GROUP', '', 'order:\r\n    number: 4321', '6a15d605621281da1e2892c994b226d2', '2022-06-17 13:22:09', '2022-06-17 05:22:10', NULL, '0:0:0:0:0:0:0:1', 'I', 'e0d4f85e-cc68-4ac6-9e33-8c7bb2dfe3f6', '');
INSERT INTO `his_config_info` VALUES (0, 15, 'nacos-02-dev-dev.yaml', 'DEFAULT_GROUP', '', 'order:\r\n    number: 444', 'e5b45196b4d5a195824ee256a70e7302', '2022-06-17 13:24:45', '2022-06-17 05:24:46', NULL, '0:0:0:0:0:0:0:1', 'I', 'e0d4f85e-cc68-4ac6-9e33-8c7bb2dfe3f6', '');
INSERT INTO `his_config_info` VALUES (9, 16, 'nacos-02-dev.yaml', 'DEFAULT_GROUP', '', 'order:\r\n    number: 4321', '6a15d605621281da1e2892c994b226d2', '2022-06-17 13:31:56', '2022-06-17 05:31:57', NULL, '0:0:0:0:0:0:0:1', 'D', 'e0d4f85e-cc68-4ac6-9e33-8c7bb2dfe3f6', '');
INSERT INTO `his_config_info` VALUES (10, 17, 'nacos-02-dev-dev.yaml', 'DEFAULT_GROUP', '', 'order:\r\n    number: 444', 'e5b45196b4d5a195824ee256a70e7302', '2022-06-17 13:31:56', '2022-06-17 05:31:57', NULL, '0:0:0:0:0:0:0:1', 'D', 'e0d4f85e-cc68-4ac6-9e33-8c7bb2dfe3f6', '');
INSERT INTO `his_config_info` VALUES (0, 18, 'naocs-02-dev.yaml', 'DEFAULT_GROUP', '', 'order:\r\n    number: dev', '5c645335709c5973b2767b07bccb0022', '2022-06-17 13:36:50', '2022-06-17 05:36:51', NULL, '0:0:0:0:0:0:0:1', 'I', '7d96b232-3a85-4bd5-bb57-fa630a50a05b', '');
INSERT INTO `his_config_info` VALUES (0, 19, 'naocs-02-prod.yaml', 'DEFAULT_GROUP', '', 'order:\r\n    number: dev', '5c645335709c5973b2767b07bccb0022', '2022-06-17 13:37:15', '2022-06-17 05:37:16', NULL, '0:0:0:0:0:0:0:1', 'I', '0d8c0105-8d08-4846-9426-ab1898c77bc1', '');
INSERT INTO `his_config_info` VALUES (12, 20, 'naocs-02-prod.yaml', 'DEFAULT_GROUP', '', 'order:\r\n    number: dev', '5c645335709c5973b2767b07bccb0022', '2022-06-17 13:37:30', '2022-06-17 05:37:31', 'nacos', '0:0:0:0:0:0:0:1', 'U', '0d8c0105-8d08-4846-9426-ab1898c77bc1', '');
INSERT INTO `his_config_info` VALUES (0, 21, 'naocs-02-test.yaml', 'DEFAULT_GROUP', '', 'order:\r\n    number: dev', '5c645335709c5973b2767b07bccb0022', '2022-06-17 13:37:55', '2022-06-17 05:37:55', NULL, '0:0:0:0:0:0:0:1', 'I', 'be4eb556-c7e9-4c1b-8ad1-0a69d27bf988', '');
INSERT INTO `his_config_info` VALUES (14, 22, 'naocs-02-test.yaml', 'DEFAULT_GROUP', '', 'order:\r\n    number: dev', '5c645335709c5973b2767b07bccb0022', '2022-06-17 13:38:05', '2022-06-17 05:38:05', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'be4eb556-c7e9-4c1b-8ad1-0a69d27bf988', '');
INSERT INTO `his_config_info` VALUES (0, 23, 'naocs-02-dev-dev.yaml', 'DEFAULT_GROUP', '', 'order:\r\n    number: dev', '5c645335709c5973b2767b07bccb0022', '2022-06-17 13:40:40', '2022-06-17 05:40:41', NULL, '0:0:0:0:0:0:0:1', 'I', '7d96b232-3a85-4bd5-bb57-fa630a50a05b', '');
INSERT INTO `his_config_info` VALUES (0, 24, 'naocs-02.yaml', 'DEFAULT_GROUP', '', 'order:\r\n    number: dev', '5c645335709c5973b2767b07bccb0022', '2022-06-17 13:43:46', '2022-06-17 05:43:46', NULL, '0:0:0:0:0:0:0:1', 'I', '7d96b232-3a85-4bd5-bb57-fa630a50a05b', '');
INSERT INTO `his_config_info` VALUES (16, 25, 'naocs-02-dev-dev.yaml', 'DEFAULT_GROUP', '', 'order:\r\n    number: dev', '5c645335709c5973b2767b07bccb0022', '2022-06-17 13:44:55', '2022-06-17 05:44:56', NULL, '0:0:0:0:0:0:0:1', 'D', '7d96b232-3a85-4bd5-bb57-fa630a50a05b', '');
INSERT INTO `his_config_info` VALUES (17, 26, 'naocs-02.yaml', 'DEFAULT_GROUP', '', 'order:\r\n    number: dev', '5c645335709c5973b2767b07bccb0022', '2022-06-17 13:44:55', '2022-06-17 05:44:56', NULL, '0:0:0:0:0:0:0:1', 'D', '7d96b232-3a85-4bd5-bb57-fa630a50a05b', '');
INSERT INTO `his_config_info` VALUES (0, 27, 'nacos-02-dev.yaml', 'DEFAULT_GROUP', '', 'order:\r\n    number: dev', '5c645335709c5973b2767b07bccb0022', '2022-06-17 13:45:07', '2022-06-17 05:45:07', NULL, '0:0:0:0:0:0:0:1', 'I', '7d96b232-3a85-4bd5-bb57-fa630a50a05b', '');
INSERT INTO `his_config_info` VALUES (11, 28, 'naocs-02-dev.yaml', 'DEFAULT_GROUP', '', 'order:\r\n    number: dev', '5c645335709c5973b2767b07bccb0022', '2022-06-17 13:45:10', '2022-06-17 05:45:11', NULL, '0:0:0:0:0:0:0:1', 'D', '7d96b232-3a85-4bd5-bb57-fa630a50a05b', '');
INSERT INTO `his_config_info` VALUES (12, 29, 'naocs-02-prod.yaml', 'DEFAULT_GROUP', '', 'order:\n    number: prod', 'b19a25429b41123b1dca54e68324ca4d', '2022-06-17 13:45:14', '2022-06-17 05:45:14', NULL, '0:0:0:0:0:0:0:1', 'D', '0d8c0105-8d08-4846-9426-ab1898c77bc1', '');
INSERT INTO `his_config_info` VALUES (14, 30, 'naocs-02-test.yaml', 'DEFAULT_GROUP', '', 'order:\n    number: test', 'e590f7b6613c1400c1805eb13cfad717', '2022-06-17 13:45:17', '2022-06-17 05:45:18', NULL, '0:0:0:0:0:0:0:1', 'D', 'be4eb556-c7e9-4c1b-8ad1-0a69d27bf988', '');
INSERT INTO `his_config_info` VALUES (0, 31, 'nacos-02-dev.yaml', 'DEFAULT_GROUP', '', 'order:\r\n    number: dev', '5c645335709c5973b2767b07bccb0022', '2022-06-17 13:46:29', '2022-06-17 05:46:29', NULL, '0:0:0:0:0:0:0:1', 'I', '0d8c0105-8d08-4846-9426-ab1898c77bc1', '');
INSERT INTO `his_config_info` VALUES (0, 32, 'nacos-02-dev.yaml', 'DEFAULT_GROUP', '', 'order:\r\n    number: dev', '5c645335709c5973b2767b07bccb0022', '2022-06-17 13:46:38', '2022-06-17 05:46:38', NULL, '0:0:0:0:0:0:0:1', 'I', 'be4eb556-c7e9-4c1b-8ad1-0a69d27bf988', '');
INSERT INTO `his_config_info` VALUES (19, 33, 'nacos-02-dev.yaml', 'DEFAULT_GROUP', '', 'order:\r\n    number: dev', '5c645335709c5973b2767b07bccb0022', '2022-06-17 13:46:51', '2022-06-17 05:46:51', 'nacos', '0:0:0:0:0:0:0:1', 'U', '0d8c0105-8d08-4846-9426-ab1898c77bc1', '');
INSERT INTO `his_config_info` VALUES (20, 34, 'nacos-02-dev.yaml', 'DEFAULT_GROUP', '', 'order:\r\n    number: dev', '5c645335709c5973b2767b07bccb0022', '2022-06-17 13:47:02', '2022-06-17 05:47:03', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'be4eb556-c7e9-4c1b-8ad1-0a69d27bf988', '');
INSERT INTO `his_config_info` VALUES (0, 35, 'nacos-02-dev.yaml', 'consumer-server', '', 'order:\n    number: prod', 'b19a25429b41123b1dca54e68324ca4d', '2022-06-17 13:50:50', '2022-06-17 05:50:50', NULL, '0:0:0:0:0:0:0:1', 'I', '0d8c0105-8d08-4846-9426-ab1898c77bc1', '');
INSERT INTO `his_config_info` VALUES (23, 36, 'nacos-02-dev.yaml', 'consumer-server', '', 'order:\n    number: prod', 'b19a25429b41123b1dca54e68324ca4d', '2022-06-17 13:51:07', '2022-06-17 05:51:07', 'nacos', '0:0:0:0:0:0:0:1', 'U', '0d8c0105-8d08-4846-9426-ab1898c77bc1', '');
INSERT INTO `his_config_info` VALUES (0, 37, 'db.yaml', 'DEFAULT_GROUP', '', 'url: http://127.0.0.1\r\nusername: admin \r\npassword: 123456\r\n', 'afc48f4a0f49bd2667915471f5e49461', '2022-06-17 14:06:41', '2022-06-17 06:06:41', NULL, '0:0:0:0:0:0:0:1', 'I', '', '');
INSERT INTO `his_config_info` VALUES (25, 38, 'db.yaml', 'DEFAULT_GROUP', '', 'url: http://127.0.0.1\r\nusername: admin \r\npassword: 123456\r\n', 'afc48f4a0f49bd2667915471f5e49461', '2022-06-17 14:23:07', '2022-06-17 06:23:08', 'nacos', '0:0:0:0:0:0:0:1', 'U', '', '');
INSERT INTO `his_config_info` VALUES (8, 39, 'nacos-02-dev.yaml', 'DEFAULT_GROUP', '', 'order:\r\n    number: 1324', '1096fe53e91d2b5b27603069f13f3cf4', '2022-06-21 09:56:39', '2022-06-21 01:56:39', NULL, '0:0:0:0:0:0:0:1', 'D', '', '');
INSERT INTO `his_config_info` VALUES (0, 40, 'nacos-02.yaml', 'DEFAULT_GROUP', '', 'order:\r\n    number: dev', '5c645335709c5973b2767b07bccb0022', '2022-06-21 09:57:02', '2022-06-21 01:57:03', NULL, '0:0:0:0:0:0:0:1', 'I', '', '');
INSERT INTO `his_config_info` VALUES (26, 41, 'nacos-02.yaml', 'DEFAULT_GROUP', '', 'order:\r\n    number: dev', '5c645335709c5973b2767b07bccb0022', '2022-06-21 09:58:23', '2022-06-21 01:58:23', NULL, '0:0:0:0:0:0:0:1', 'D', '', '');
INSERT INTO `his_config_info` VALUES (0, 42, 'nacos-02.yaml', 'consumer-server', '', 'order:\n    number: prod-consumer-server', '6de0b988d29227fd19f54de570d18a12', '2022-06-21 09:58:47', '2022-06-21 01:58:48', NULL, '0:0:0:0:0:0:0:1', 'I', '', '');
INSERT INTO `his_config_info` VALUES (0, 43, 'my-sentinel-flow-rule', 'DEFAULT_GROUP', '', '[\r\n  {\r\n    \"clusterMode\": false,\r\n    \"controlBehavior\": 0,\r\n    \"count\": 1.0,\r\n    \"grade\": 1,\r\n    \"limitApp\": \"default\",\r\n    \"maxQueueingTimeMs\": 500,\r\n    \"resource\": \"sayHello\",\r\n    \"strategy\": 0,\r\n    \"warmUpPeriodSec\": 10\r\n  }\r\n]', 'c3d29f5436e88ec57b9a19f195b3e983', '2022-06-21 15:54:16', '2022-06-21 07:54:16', NULL, '0:0:0:0:0:0:0:1', 'I', '', '');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `resource` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `action` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  UNIQUE INDEX `uk_role_permission`(`role`, `resource`, `action`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  UNIQUE INDEX `idx_user_role`(`username`, `role`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('nacos', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数',
  `max_aggr_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '租户容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_info_kptenantid`(`kp`, `tenant_id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'tenant_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_info
-- ----------------------------
INSERT INTO `tenant_info` VALUES (3, '1', '7d96b232-3a85-4bd5-bb57-fa630a50a05b', 'dev', 'dev', 'nacos', 1655444088118, 1655444088118);
INSERT INTO `tenant_info` VALUES (4, '1', '0d8c0105-8d08-4846-9426-ab1898c77bc1', 'prod', 'prod', 'nacos', 1655444098955, 1655444098955);
INSERT INTO `tenant_info` VALUES (5, '1', 'be4eb556-c7e9-4c1b-8ad1-0a69d27bf988', 'test', 'test', 'nacos', 1655444105312, 1655444105312);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', 1);

SET FOREIGN_KEY_CHECKS = 1;
