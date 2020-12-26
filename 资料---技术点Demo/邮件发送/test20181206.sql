/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50022
 Source Host           : localhost:3306
 Source Schema         : test20181206

 Target Server Type    : MySQL
 Target Server Version : 50022
 File Encoding         : 65001

 Date: 22/12/2020 12:30:39
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ustate` int(11) NULL DEFAULT NULL,
  `ucode` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('55bede3c-760b-4c10-bde4-1082c5e253c3', '张三', '11', '909904682@qq.com', 2, 'CF6Y', NULL);
INSERT INTO `user` VALUES ('d0168f7d-2240-4ff0-84d3-239c877b65c7', '张三', '11', '909904682@qq.com', 1, 'YTV3', NULL);

SET FOREIGN_KEY_CHECKS = 1;
