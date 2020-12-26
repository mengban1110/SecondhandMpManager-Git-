/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50022
 Source Host           : localhost:3306
 Source Schema         : secondhandmpmanager

 Target Server Type    : MySQL
 Target Server Version : 50022
 File Encoding         : 65001

 Date: 24/12/2020 04:22:26
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `account_username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `account_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `account_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `account_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `account_status` int(255) NULL DEFAULT NULL,
  `account_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`account_id`),
  INDEX `account_status` USING BTREE(`account_status`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`account_status`) REFERENCES `accstatus` (`accstatus_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 7168 kB; (`account_status`) REFER `secondhandmp' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES (1, '梦伴', 'DreamofOriginal', 'wushang816', '2662252561@qq.com', '河北唐山诚安友谊天地', 1, NULL);

-- ----------------------------
-- Table structure for accstatus
-- ----------------------------
DROP TABLE IF EXISTS `accstatus`;
CREATE TABLE `accstatus`  (
  `accstatus_id` int(11) NOT NULL AUTO_INCREMENT,
  `accstatus_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`accstatus_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of accstatus
-- ----------------------------
INSERT INTO `accstatus` VALUES (1, '已激活');
INSERT INTO `accstatus` VALUES (2, '未激活');

-- ----------------------------
-- Table structure for ad
-- ----------------------------
DROP TABLE IF EXISTS `ad`;
CREATE TABLE `ad`  (
  `ad_id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`ad_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ad
-- ----------------------------
INSERT INTO `ad` VALUES (1, '双十一购物节 全场九折');

-- ----------------------------
-- Table structure for blockword
-- ----------------------------
DROP TABLE IF EXISTS `blockword`;
CREATE TABLE `blockword`  (
  `blockword_id` int(11) NOT NULL AUTO_INCREMENT,
  `blockword_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`blockword_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of blockword
-- ----------------------------
INSERT INTO `blockword` VALUES (1, 'test');
INSERT INTO `blockword` VALUES (2, 'stop');

-- ----------------------------
-- Table structure for brand
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand`  (
  `brand_id` int(255) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`brand_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES (1, '苹果');
INSERT INTO `brand` VALUES (2, '华为');
INSERT INTO `brand` VALUES (3, '小米');
INSERT INTO `brand` VALUES (4, '三星');
INSERT INTO `brand` VALUES (5, '魅族');
INSERT INTO `brand` VALUES (6, 'OPPO');
INSERT INTO `brand` VALUES (7, '锤子');
INSERT INTO `brand` VALUES (8, 'VIVO');
INSERT INTO `brand` VALUES (9, 'OnePlus');

-- ----------------------------
-- Table structure for buyhistory
-- ----------------------------
DROP TABLE IF EXISTS `buyhistory`;
CREATE TABLE `buyhistory`  (
  `buyhistory_id` int(11) NOT NULL AUTO_INCREMENT,
  `buyhistory_mpinfoid` int(11) NULL DEFAULT NULL,
  `buyhistory_status` int(255) NULL DEFAULT NULL,
  `buyhistory_belongaccid` int(255) NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`buyhistory_id`),
  INDEX `buyhistory_mpinfoid` USING BTREE(`buyhistory_mpinfoid`),
  INDEX `buyhistory_belongaccid` USING BTREE(`buyhistory_belongaccid`),
  INDEX `buyhistory_status` USING BTREE(`buyhistory_status`),
  CONSTRAINT `buyhistory_ibfk_1` FOREIGN KEY (`buyhistory_mpinfoid`) REFERENCES `mpinfo` (`MpInfo_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `buyhistory_ibfk_2` FOREIGN KEY (`buyhistory_belongaccid`) REFERENCES `account` (`account_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `buyhistory_ibfk_3` FOREIGN KEY (`buyhistory_status`) REFERENCES `buystatus` (`buystatus_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 7168 kB; (`buyhistory_status`) REFER `secondhan' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of buyhistory
-- ----------------------------
INSERT INTO `buyhistory` VALUES (1, 1, 4, 1);

-- ----------------------------
-- Table structure for buystatus
-- ----------------------------
DROP TABLE IF EXISTS `buystatus`;
CREATE TABLE `buystatus`  (
  `buystatus_id` int(11) NOT NULL AUTO_INCREMENT,
  `buystatus_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`buystatus_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of buystatus
-- ----------------------------
INSERT INTO `buystatus` VALUES (1, '未派送');
INSERT INTO `buystatus` VALUES (2, '运输中');
INSERT INTO `buystatus` VALUES (3, '派送中');
INSERT INTO `buystatus` VALUES (4, '签收完');

-- ----------------------------
-- Table structure for color
-- ----------------------------
DROP TABLE IF EXISTS `color`;
CREATE TABLE `color`  (
  `color_id` int(11) NOT NULL AUTO_INCREMENT,
  `color_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`color_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of color
-- ----------------------------
INSERT INTO `color` VALUES (1, '红色');
INSERT INTO `color` VALUES (2, '绿色');
INSERT INTO `color` VALUES (3, '蓝色');
INSERT INTO `color` VALUES (4, '紫色');
INSERT INTO `color` VALUES (5, '黑色');
INSERT INTO `color` VALUES (6, '银色');
INSERT INTO `color` VALUES (7, '黄色');
INSERT INTO `color` VALUES (8, '橙色');

-- ----------------------------
-- Table structure for condition
-- ----------------------------
DROP TABLE IF EXISTS `condition`;
CREATE TABLE `condition`  (
  `condition_id` int(11) NOT NULL AUTO_INCREMENT,
  `condition_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`condition_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of condition
-- ----------------------------
INSERT INTO `condition` VALUES (1, '九九新');
INSERT INTO `condition` VALUES (2, '九五新');
INSERT INTO `condition` VALUES (3, '九成新');
INSERT INTO `condition` VALUES (4, '八五新');
INSERT INTO `condition` VALUES (5, '八成新');
INSERT INTO `condition` VALUES (6, '七五新');
INSERT INTO `condition` VALUES (7, '七成新');
INSERT INTO `condition` VALUES (8, '六成新');

-- ----------------------------
-- Table structure for infostatus
-- ----------------------------
DROP TABLE IF EXISTS `infostatus`;
CREATE TABLE `infostatus`  (
  `infostatus_id` int(255) NOT NULL AUTO_INCREMENT,
  `infostatus_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`infostatus_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of infostatus
-- ----------------------------
INSERT INTO `infostatus` VALUES (1, '正在出售');
INSERT INTO `infostatus` VALUES (2, '已经出售');

-- ----------------------------
-- Table structure for losephone
-- ----------------------------
DROP TABLE IF EXISTS `losephone`;
CREATE TABLE `losephone`  (
  `losephone_id` int(11) NOT NULL AUTO_INCREMENT,
  `losephone_MIME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`losephone_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of losephone
-- ----------------------------
INSERT INTO `losephone` VALUES (1, '355637051875045');
INSERT INTO `losephone` VALUES (2, '355637052788650');
INSERT INTO `losephone` VALUES (3, '355637052238805');
INSERT INTO `losephone` VALUES (4, '355637053986139');
INSERT INTO `losephone` VALUES (5, '355637051954873');

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager`  (
  `manager_id` int(11) NOT NULL AUTO_INCREMENT,
  `manager_nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `manager_username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `manager_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `manager_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `manager_status` int(255) NULL DEFAULT NULL,
  `manager_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`manager_id`),
  INDEX `manager_status` USING BTREE(`manager_status`),
  CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`manager_status`) REFERENCES `accstatus` (`accstatus_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 8192 kB; (`manager_status`) REFER `secondhandmp' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES (1, '梦伴如初', 'mengban', 'wushang816', '1576776108@qq.com', 1, 'QQQQ');
INSERT INTO `manager` VALUES (6, '测试...', 'test', 'wushang816', '2662252562@qq.com', 1, 'F4HP');
INSERT INTO `manager` VALUES (10, '默认', '32131221', '1212312', '2662252561@qq.com', 2, '8VNY');

-- ----------------------------
-- Table structure for mpinfo
-- ----------------------------
DROP TABLE IF EXISTS `mpinfo`;
CREATE TABLE `mpinfo`  (
  `MpInfo_id` int(11) NOT NULL AUTO_INCREMENT,
  `MpInfo_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MpInfo_brand` int(255) NULL DEFAULT NULL,
  `MpInfo_version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MpInfo_ram` int(255) NULL DEFAULT NULL,
  `MpInfo_color` int(255) NULL DEFAULT NULL,
  `MpInfo_condition` int(255) NULL DEFAULT NULL,
  `MpInfo_price` decimal(10, 2) NULL DEFAULT NULL,
  `MpInfo_buyTime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MpInfo_MIME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MpInfo_status` int(255) NULL DEFAULT NULL,
  `MpInfo_photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`MpInfo_id`),
  INDEX `MpInfo_brand` USING BTREE(`MpInfo_brand`),
  INDEX `MpInfo_color` USING BTREE(`MpInfo_color`),
  INDEX `MpInfo_status` USING BTREE(`MpInfo_status`),
  INDEX `MpInfo_ram` USING BTREE(`MpInfo_ram`),
  INDEX `MpInfo_condition` USING BTREE(`MpInfo_condition`),
  CONSTRAINT `mpinfo_ibfk_1` FOREIGN KEY (`MpInfo_brand`) REFERENCES `brand` (`brand_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mpinfo_ibfk_2` FOREIGN KEY (`MpInfo_color`) REFERENCES `color` (`color_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mpinfo_ibfk_3` FOREIGN KEY (`MpInfo_status`) REFERENCES `infostatus` (`infostatus_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mpinfo_ibfk_4` FOREIGN KEY (`MpInfo_ram`) REFERENCES `ram` (`ram_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mpinfo_ibfk_5` FOREIGN KEY (`MpInfo_condition`) REFERENCES `condition` (`condition_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 7168 kB; (`MpInfo_brand`) REFER `secondhandmpma' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of mpinfo
-- ----------------------------
INSERT INTO `mpinfo` VALUES (1, NULL, 1, 'IphoneX', 4, 6, 2, 2500.00, '2019年7月', '355637051875045', 1, NULL);
INSERT INTO `mpinfo` VALUES (2, NULL, 2, 'Mate30Pro5G', 6, 4, 3, 3800.00, '2019年12月', '355637052788650', 1, NULL);
INSERT INTO `mpinfo` VALUES (3, NULL, 3, '小米10Pro', 5, 5, 1, 4700.00, '2020年3月', '355637057190372', 1, NULL);
INSERT INTO `mpinfo` VALUES (4, NULL, 4, 'S10Edge', 4, 2, 4, 1200.00, '2017年7月', '323437051178650', 1, NULL);
INSERT INTO `mpinfo` VALUES (5, NULL, 5, '魅族17pro', 6, 8, 3, 3900.00, '2020年5月', '355637231635045', 1, NULL);
INSERT INTO `mpinfo` VALUES (6, NULL, 6, 'Reno5', 5, 1, 7, 4300.00, '2018年10月', '355637021980372', 1, NULL);
INSERT INTO `mpinfo` VALUES (7, NULL, 7, '坚果pro3', 4, 7, 2, 4400.00, '2019年1月', '359349569392215', 1, NULL);
INSERT INTO `mpinfo` VALUES (8, NULL, 7, 'VIVOx60', 5, 3, 1, 5999.00, '2020年12月', '395489734958231', 1, NULL);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`notice_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '本站将于明天进行系统维护 暂停运营一天');

-- ----------------------------
-- Table structure for ram
-- ----------------------------
DROP TABLE IF EXISTS `ram`;
CREATE TABLE `ram`  (
  `ram_id` int(11) NOT NULL AUTO_INCREMENT,
  `ram_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`ram_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ram
-- ----------------------------
INSERT INTO `ram` VALUES (1, '8GB');
INSERT INTO `ram` VALUES (2, '16GB');
INSERT INTO `ram` VALUES (3, '32GB');
INSERT INTO `ram` VALUES (4, '64GB');
INSERT INTO `ram` VALUES (5, '128GB');
INSERT INTO `ram` VALUES (6, '256GB');

SET FOREIGN_KEY_CHECKS = 1;
