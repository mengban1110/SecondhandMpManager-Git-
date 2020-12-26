/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50022
 Source Host           : localhost:3306
 Source Schema         : exam

 Target Server Type    : MySQL
 Target Server Version : 50022
 File Encoding         : 65001

 Date: 22/12/2020 12:31:07
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bevisit
-- ----------------------------
DROP TABLE IF EXISTS `bevisit`;
CREATE TABLE `bevisit`  (
  `beid` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `bename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `besex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`beid`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of bevisit
-- ----------------------------
INSERT INTO `bevisit` VALUES ('1', '小李1', '男', '15613888862');
INSERT INTO `bevisit` VALUES ('2', '小黑', '女', '18633133780');
INSERT INTO `bevisit` VALUES ('3', '小绿', '男', '18723331902');
INSERT INTO `bevisit` VALUES ('4', '小梦123', '男', '15613888862');

-- ----------------------------
-- Table structure for infomation
-- ----------------------------
DROP TABLE IF EXISTS `infomation`;
CREATE TABLE `infomation`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `visit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bevisit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`id`),
  INDEX `bevisit` USING BTREE(`bevisit`),
  INDEX `visit` USING BTREE(`visit`),
  CONSTRAINT `infomation_ibfk_1` FOREIGN KEY (`bevisit`) REFERENCES `bevisit` (`beid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `infomation_ibfk_2` FOREIGN KEY (`visit`) REFERENCES `visit` (`vid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 8192 kB; (`bevisit`) REFER `exam/bevisit`(`beid`) ON UPDATE CASCADE' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of infomation
-- ----------------------------
INSERT INTO `infomation` VALUES (1, '1', '1', '2020.12.10 08:41:27 ');
INSERT INTO `infomation` VALUES (2, '2', '2', '2020.12.10 08:41:51 ');
INSERT INTO `infomation` VALUES (3, '3', '3', '2020.12.10 08:41:51 ');

-- ----------------------------
-- Table structure for visit
-- ----------------------------
DROP TABLE IF EXISTS `visit`;
CREATE TABLE `visit`  (
  `vid` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `vname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`vid`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of visit
-- ----------------------------
INSERT INTO `visit` VALUES ('1', '小黑');
INSERT INTO `visit` VALUES ('2', '小王');
INSERT INTO `visit` VALUES ('3', '小豪');
INSERT INTO `visit` VALUES ('4', '小梦321');
INSERT INTO `visit` VALUES ('5', '321');
INSERT INTO `visit` VALUES ('6', '111');
INSERT INTO `visit` VALUES ('7', '小刘zzz');
INSERT INTO `visit` VALUES ('91', '陈飞羽');
INSERT INTO `visit` VALUES ('9111', '陈飞羽');

SET FOREIGN_KEY_CHECKS = 1;
